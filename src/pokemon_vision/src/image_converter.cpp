#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>

using namespace std;
using namespace cv;
static const std::string OPENCV_WINDOW = "Image window";

class ImageConverter
{
    ros::NodeHandle nh_;
    image_transport::ImageTransport it_;
    image_transport::Subscriber image_sub_;
    image_transport::Publisher image_pub_;

public:
    ImageConverter()
            : it_(nh_)
    {
        image_sub_ = it_.subscribe("/tb3_1/camera/image", 1,
                                    &ImageConverter::imageCb2, this);
        image_pub_ = it_.advertise("/image_converter/output_video", 1);

        cv::namedWindow(OPENCV_WINDOW);
    }

    ~ImageConverter()
    {
        cv::destroyWindow(OPENCV_WINDOW);
    }

    void imageCb2(const sensor_msgs::ImageConstPtr& msg)
    {
        cv_bridge::CvImagePtr cv_ptr;
        try
        {
            cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
        }
        catch(cv_bridge::Exception& e)
        {
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
        }

        //dectect circles
        Mat img_cvt;
        cvtColor(cv_ptr->image, img_cvt, CV_BGR2GRAY);  // 转为灰度图
        //threshold(img_cvt, img_cvt, 20, 255, CV_THRESH_BINARY + CV_THRESH_OTSU);  // 二值化
        threshold(img_cvt, img_cvt, 75, 255, 0);  // 二值化
        cv::imshow(OPENCV_WINDOW, img_cvt);
        cv::waitKey(400);
        //cv::Canny(img_cvt, img_cvt, 40, 120);
        Mat kernal = getStructuringElement(1, Size(3, 3));
        erode(img_cvt, img_cvt, kernal);
        
        vector<vector<cv::Point>> contours;
        // vector<Vec4i> hierarchy;
        findContours(img_cvt, contours, CV_RETR_LIST, CHAIN_APPROX_SIMPLE, Point());
        int first_index = 0;
        
        for (size_t i = 0; i < contours.size(); i++)
        {
            if (contourArea(contours[first_index]) < contourArea(contours[i])){
                first_index = i;
            }
        }
        cout << "ini size is : " << contours[first_index].size() << endl;
        cv::Rect rect = cv::boundingRect(contours[first_index]);
        cv::rectangle(cv_ptr->image, rect, cv::Scalar(0,0,255));
        
        contours.erase(contours.begin()+first_index);
        int second_index = 0;
        for (size_t i = 0; i < contours.size(); i++)
        {
            if (contourArea(contours[second_index]) < contourArea(contours[i])){
                second_index = i;
            }
        }
        cout << "second size is : " << contours[second_index].size() << endl;
        rect = cv::boundingRect(contours[second_index]);
        cv::rectangle(cv_ptr->image, rect, cv::Scalar(0,255,0));
        
        // cv::imshow(OPENCV_WINDOW, cv_ptr->image);
        // cv::waitKey(400);

        // output modified video stream
        image_pub_.publish(cv_ptr->toImageMsg());
    }



    void imageCb(const sensor_msgs::ImageConstPtr& msg)
    {
        cv_bridge::CvImagePtr cv_ptr;
        try
        {
            cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
        }
        catch(cv_bridge::Exception& e)
        {
            ROS_ERROR("cv_bridge exception: %s", e.what());
            return;
        }

        if (cv_ptr->image.rows > 60 && cv_ptr->image.cols > 60)
            cv::circle(cv_ptr->image, cv::Point(50, 50), 10, CV_RGB(255,0,0));  // draw circle

        cv::imshow(OPENCV_WINDOW, cv_ptr->image);
        cv::waitKey(3);

        image_pub_.publish(cv_ptr->toImageMsg());
    }
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "image_converter");
    ImageConverter ic;
    ros::spin();
    return 0;
}