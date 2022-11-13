
"use strict";

let BoundingBoxes = require('./BoundingBoxes.js');
let BoundingBox = require('./BoundingBox.js');
let ObjectCount = require('./ObjectCount.js');
let CheckForObjectsActionGoal = require('./CheckForObjectsActionGoal.js');
let CheckForObjectsActionFeedback = require('./CheckForObjectsActionFeedback.js');
let CheckForObjectsGoal = require('./CheckForObjectsGoal.js');
let CheckForObjectsAction = require('./CheckForObjectsAction.js');
let CheckForObjectsFeedback = require('./CheckForObjectsFeedback.js');
let CheckForObjectsActionResult = require('./CheckForObjectsActionResult.js');
let CheckForObjectsResult = require('./CheckForObjectsResult.js');

module.exports = {
  BoundingBoxes: BoundingBoxes,
  BoundingBox: BoundingBox,
  ObjectCount: ObjectCount,
  CheckForObjectsActionGoal: CheckForObjectsActionGoal,
  CheckForObjectsActionFeedback: CheckForObjectsActionFeedback,
  CheckForObjectsGoal: CheckForObjectsGoal,
  CheckForObjectsAction: CheckForObjectsAction,
  CheckForObjectsFeedback: CheckForObjectsFeedback,
  CheckForObjectsActionResult: CheckForObjectsActionResult,
  CheckForObjectsResult: CheckForObjectsResult,
};
