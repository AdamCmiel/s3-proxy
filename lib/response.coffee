express = require "express"
AWS = require "aws-sdk"
Promise = require "bluebird"

AWS.config = new AWS.Config
  accessKeyId: process.env.AWS_ACCESS_KEY
  secretAccessKey: process.env.AWS_SECRET_KEY
  region: 'us-west-2'

s3 = new AWS.S3
Promise.promisifyAll s3.constructor::

getRecentPhotos = (req, res) ->
  s3.getObjectAsync
    Bucket: "com.adamcmiel.energiesbalanced"
    Key: "eb_instagram_feed.json"
  .then (data) ->
    res.send data.Body.toString()
  .catch (err) ->
    res.status 500
       .send "Error retreiving resource: #{err.message}"

module.exports = getRecentPhotos
