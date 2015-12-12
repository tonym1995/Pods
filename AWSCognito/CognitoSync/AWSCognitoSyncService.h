/*
 Copyright 2010-2015 Amazon.com, Inc. or its affiliates. All Rights Reserved.

 Licensed under the Apache License, Version 2.0 (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at

 http://aws.amazon.com/apache2.0

 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

#import <Foundation/Foundation.h>
#import <AWSCore/AWSCore.h>
#import "AWSCognitoSyncModel.h"
/**
 <fullname>Amazon Cognito Sync</fullname><p>Amazon Cognito Sync provides an AWS service and client library that enable cross-device syncing of application-related user data. High-level client libraries are available for both iOS and Android. You can use these libraries to persist data locally so that it's available even if the device is offline. Developer credentials don't need to be stored on the mobile device to access the service. You can use Amazon Cognito to obtain a normalized user ID and credentials. User data is persisted in a dataset that can store up to 1 MB of key-value pairs, and you can have up to 20 datasets per user identity.</p><p>With Amazon Cognito Sync, the data stored for each identity is accessible only to credentials assigned to that identity. In order to use the Cognito Sync service, you need to make API calls using credentials retrieved with <a href="http://docs.aws.amazon.com/cognitoidentity/latest/APIReference/Welcome.html">Amazon Cognito Identity service</a>.</p><p>If you want to use Cognito Sync in an Android or iOS application, you will probably want to make API calls via the AWS Mobile SDK. To learn more, see the <a href="http://docs.aws.amazon.com/mobile/sdkforandroid/developerguide/cognito-sync.html">Developer Guide for Android</a> and the <a href="http://docs.aws.amazon.com/mobile/sdkforios/developerguide/cognito-sync.html">Developer Guide for iOS</a>.</p>
 */
@interface AWSCognitoSync : AWSService

/**
 The service configuration used to instantiate this service client.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 */
@property (nonatomic, strong, readonly) AWSServiceConfiguration *configuration;

/**
 Returns the singleton service client. If the singleton object does not exist, the SDK instantiates the default service client with `defaultServiceConfiguration` from `[AWSServiceManager defaultServiceManager]`. The reference to this object is maintained by the SDK, and you do not need to retain it manually.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`
 
 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USEast1, credentialsProvider: credentialProvider)
         AWSServiceManager.defaultServiceManager().defaultServiceConfiguration = configuration

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
          AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                          identityPoolId:@"YourIdentityPoolId"];
          AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSEast1
                                                                               credentialsProvider:credentialsProvider];
          [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;

          return YES;
      }

 Then call the following to get the default service client:

 *Swift*

     let CognitoSync = AWSCognitoSync.defaultCognitoSync()

 *Objective-C*

     AWSCognitoSync *CognitoSync = [AWSCognitoSync defaultCognitoSync];

 @return The default service client.
 */
+ (instancetype)defaultCognitoSync;

/**
 Creates a service client with the given service configuration and registers it for the key.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSCognitoSync.registerCognitoSyncWithConfiguration(configuration, forKey: "USWest2CognitoSync")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:@"USWest2CognitoSync"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CognitoSync = AWSCognitoSync(forKey: "USWest2CognitoSync")

 *Objective-C*

     AWSCognitoSync *CognitoSync = [AWSCognitoSync CognitoSyncForKey:@"USWest2CognitoSync"];

 @warning After calling this method, do not modify the configuration object. It may cause unspecified behaviors.

 @param configuration A service configuration object.
 @param key           A string to identify the service client.
 */
+ (void)registerCognitoSyncWithConfiguration:(AWSServiceConfiguration *)configuration forKey:(NSString *)key;

/**
 Retrieves the service client associated with the key. You need to call `+ registerCognitoSyncWithConfiguration:forKey:` before invoking this method. If `+ registerCognitoSyncWithConfiguration:forKey:` has not been called in advance or the key does not exist, this method returns `nil`.

 For example, set the default service configuration in `- application:didFinishLaunchingWithOptions:`

 *Swift*

     func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
         let credentialProvider = AWSCognitoCredentialsProvider(regionType: .USEast1, identityPoolId: "YourIdentityPoolId")
         let configuration = AWSServiceConfiguration(region: .USWest2, credentialsProvider: credentialProvider)
         AWSCognitoSync.registerCognitoSyncWithConfiguration(configuration, forKey: "USWest2CognitoSync")

         return true
     }

 *Objective-C*

     - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         AWSCognitoCredentialsProvider *credentialsProvider = [[AWSCognitoCredentialsProvider alloc] initWithRegionType:AWSRegionUSEast1
                                                                                                         identityPoolId:@"YourIdentityPoolId"];
         AWSServiceConfiguration *configuration = [[AWSServiceConfiguration alloc] initWithRegion:AWSRegionUSWest2
                                                                              credentialsProvider:credentialsProvider];

         [AWSCognitoSync registerCognitoSyncWithConfiguration:configuration forKey:@"USWest2CognitoSync"];

         return YES;
     }

 Then call the following to get the service client:

 *Swift*

     let CognitoSync = AWSCognitoSync(forKey: "USWest2CognitoSync")

 *Objective-C*

     AWSCognitoSync *CognitoSync = [AWSCognitoSync CognitoSyncForKey:@"USWest2CognitoSync"];

 @param key A string to identify the service client.

 @return An instance of the service client.
 */
+ (instancetype)CognitoSyncForKey:(NSString *)key;

/**
 Removes the service client associated with the key and release it.
 
 @warning Before calling this method, make sure no method is running on this client.
 
 @param key A string to identify the service client.
 */
+ (void)removeCognitoSyncForKey:(NSString *)key;

/**
 Instantiates the service client with the given service configuration.
 
 @warning This method has been deprecated. Use `+ registerCognitoSyncWithConfiguration:forKey:` and `+ CognitoSyncForKey:` instead.
 
 @warning Once the client is instantiated, do not modify the configuration object. It may cause unspecified behaviors.
 
 @warning Unlike the singleton method, you are responsible for maintaining a strong reference to this object. If the service client is released before completing a service request, the request may fail with unspecified errors.
 
 @param configuration The service configuration object.
 
 @return An instance of the service client.
 */
- (instancetype)initWithConfiguration:(AWSServiceConfiguration *)configuration __attribute__ ((deprecated("Use '+ registerCognitoSyncWithConfiguration:forKey:' and '+ CognitoSyncForKey:' instead.")));

/**
 <p>Initiates a bulk publish of all existing datasets for an Identity Pool to the configured stream. Customers are limited to one successful bulk publish per 24 hours. Bulk publish is an asynchronous request, customers can see the status of the request via the GetBulkPublishDetails operation.</p><p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>
 
 @param request A container for the necessary parameters to execute the BulkPublish service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncBulkPublishResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorDuplicateRequest`, `AWSCognitoSyncErrorAlreadyStreamed`.
 
 @see AWSCognitoSyncBulkPublishRequest
 @see AWSCognitoSyncBulkPublishResponse
 */
- (AWSTask *)bulkPublish:(AWSCognitoSyncBulkPublishRequest *)request;

/**
 <p>Deletes the specific dataset. The dataset will be deleted permanently, and the action can't be undone. Datasets that this dataset was merged with will no longer report the merge. Any subsequent operation on this dataset will result in a ResourceNotFoundException.</p><p>This API can be called with temporary user credentials provided by Cognito Identity or with developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the DeleteDataset service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncDeleteDatasetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorTooManyRequests`, `AWSCognitoSyncErrorResourceConflict`.
 
 @see AWSCognitoSyncDeleteDatasetRequest
 @see AWSCognitoSyncDeleteDatasetResponse
 */
- (AWSTask *)deleteDataset:(AWSCognitoSyncDeleteDatasetRequest *)request;

/**
 <p>Gets meta data about a dataset by identity and dataset name. With Amazon Cognito Sync, each identity has access only to its own data. Thus, the credentials used to make this API call need to have access to the identity data.</p><p>This API can be called with temporary user credentials provided by Cognito Identity or with developer credentials. You should use Cognito Identity credentials to make this API call.</p>
 
 @param request A container for the necessary parameters to execute the DescribeDataset service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncDescribeDatasetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorTooManyRequests`.
 
 @see AWSCognitoSyncDescribeDatasetRequest
 @see AWSCognitoSyncDescribeDatasetResponse
 */
- (AWSTask *)describeDataset:(AWSCognitoSyncDescribeDatasetRequest *)request;

/**
 <p>Gets usage details (for example, data storage) about a particular identity pool.</p><p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityPoolUsage service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncDescribeIdentityPoolUsageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorTooManyRequests`.
 
 @see AWSCognitoSyncDescribeIdentityPoolUsageRequest
 @see AWSCognitoSyncDescribeIdentityPoolUsageResponse
 */
- (AWSTask *)describeIdentityPoolUsage:(AWSCognitoSyncDescribeIdentityPoolUsageRequest *)request;

/**
 <p>Gets usage information for an identity, including number of datasets and data usage.</p><p>This API can be called with temporary user credentials provided by Cognito Identity or with developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the DescribeIdentityUsage service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncDescribeIdentityUsageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorTooManyRequests`.
 
 @see AWSCognitoSyncDescribeIdentityUsageRequest
 @see AWSCognitoSyncDescribeIdentityUsageResponse
 */
- (AWSTask *)describeIdentityUsage:(AWSCognitoSyncDescribeIdentityUsageRequest *)request;

/**
 <p>Get the status of the last BulkPublish operation for an identity pool.</p><p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>
 
 @param request A container for the necessary parameters to execute the GetBulkPublishDetails service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncGetBulkPublishDetailsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorInternalError`.
 
 @see AWSCognitoSyncGetBulkPublishDetailsRequest
 @see AWSCognitoSyncGetBulkPublishDetailsResponse
 */
- (AWSTask *)getBulkPublishDetails:(AWSCognitoSyncGetBulkPublishDetailsRequest *)request;

/**
 <p>Gets the events and the corresponding Lambda functions associated with an identity pool.</p><p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>
 
 @param request A container for the necessary parameters to execute the GetCognitoEvents service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncGetCognitoEventsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorTooManyRequests`.
 
 @see AWSCognitoSyncGetCognitoEventsRequest
 @see AWSCognitoSyncGetCognitoEventsResponse
 */
- (AWSTask *)getCognitoEvents:(AWSCognitoSyncGetCognitoEventsRequest *)request;

/**
 <p>Gets the configuration settings of an identity pool.</p><p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>
 
 @param request A container for the necessary parameters to execute the GetIdentityPoolConfiguration service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncGetIdentityPoolConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorTooManyRequests`.
 
 @see AWSCognitoSyncGetIdentityPoolConfigurationRequest
 @see AWSCognitoSyncGetIdentityPoolConfigurationResponse
 */
- (AWSTask *)getIdentityPoolConfiguration:(AWSCognitoSyncGetIdentityPoolConfigurationRequest *)request;

/**
 <p>Lists datasets for an identity. With Amazon Cognito Sync, each identity has access only to its own data. Thus, the credentials used to make this API call need to have access to the identity data.</p><p>ListDatasets can be called with temporary user credentials provided by Cognito Identity or with developer credentials. You should use the Cognito Identity credentials to make this API call.</p>
 
 @param request A container for the necessary parameters to execute the ListDatasets service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncListDatasetsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorTooManyRequests`.
 
 @see AWSCognitoSyncListDatasetsRequest
 @see AWSCognitoSyncListDatasetsResponse
 */
- (AWSTask *)listDatasets:(AWSCognitoSyncListDatasetsRequest *)request;

/**
 <p>Gets a list of identity pools registered with Cognito.</p><p>ListIdentityPoolUsage can only be called with developer credentials. You cannot make this API call with the temporary user credentials provided by Cognito Identity.</p>
 
 @param request A container for the necessary parameters to execute the ListIdentityPoolUsage service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncListIdentityPoolUsageResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorTooManyRequests`.
 
 @see AWSCognitoSyncListIdentityPoolUsageRequest
 @see AWSCognitoSyncListIdentityPoolUsageResponse
 */
- (AWSTask *)listIdentityPoolUsage:(AWSCognitoSyncListIdentityPoolUsageRequest *)request;

/**
 <p>Gets paginated records, optionally changed after a particular sync count for a dataset and identity. With Amazon Cognito Sync, each identity has access only to its own data. Thus, the credentials used to make this API call need to have access to the identity data.</p><p>ListRecords can be called with temporary user credentials provided by Cognito Identity or with developer credentials. You should use Cognito Identity credentials to make this API call.</p>
 
 @param request A container for the necessary parameters to execute the ListRecords service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncListRecordsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorTooManyRequests`, `AWSCognitoSyncErrorInternalError`.
 
 @see AWSCognitoSyncListRecordsRequest
 @see AWSCognitoSyncListRecordsResponse
 */
- (AWSTask *)listRecords:(AWSCognitoSyncListRecordsRequest *)request;

/**
 <p>Registers a device to receive push sync notifications.</p><p>This API can only be called with temporary credentials provided by Cognito Identity. You cannot call this API with developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the RegisterDevice service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncRegisterDeviceResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorInvalidConfiguration`, `AWSCognitoSyncErrorTooManyRequests`.
 
 @see AWSCognitoSyncRegisterDeviceRequest
 @see AWSCognitoSyncRegisterDeviceResponse
 */
- (AWSTask *)registerDevice:(AWSCognitoSyncRegisterDeviceRequest *)request;

/**
 <p>Sets the AWS Lambda function for a given event type for an identity pool. This request only updates the key/value pair specified. Other key/values pairs are not updated. To remove a key value pair, pass a empty value for the particular key.</p><p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>
 
 @param request A container for the necessary parameters to execute the SetCognitoEvents service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will be `nil`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorTooManyRequests`.
 
 @see AWSCognitoSyncSetCognitoEventsRequest
 */
- (AWSTask *)setCognitoEvents:(AWSCognitoSyncSetCognitoEventsRequest *)request;

/**
 <p>Sets the necessary configuration for push sync.</p><p>This API can only be called with developer credentials. You cannot call this API with the temporary user credentials provided by Cognito Identity.</p>
 
 @param request A container for the necessary parameters to execute the SetIdentityPoolConfiguration service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncSetIdentityPoolConfigurationResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorTooManyRequests`, `AWSCognitoSyncErrorLimitExceeded`.
 
 @see AWSCognitoSyncSetIdentityPoolConfigurationRequest
 @see AWSCognitoSyncSetIdentityPoolConfigurationResponse
 */
- (AWSTask *)setIdentityPoolConfiguration:(AWSCognitoSyncSetIdentityPoolConfigurationRequest *)request;

/**
 <p>Subscribes to receive notifications when a dataset is modified by another device.</p><p>This API can only be called with temporary credentials provided by Cognito Identity. You cannot call this API with developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the SubscribeToDataset service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncSubscribeToDatasetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorInvalidConfiguration`, `AWSCognitoSyncErrorTooManyRequests`.
 
 @see AWSCognitoSyncSubscribeToDatasetRequest
 @see AWSCognitoSyncSubscribeToDatasetResponse
 */
- (AWSTask *)subscribeToDataset:(AWSCognitoSyncSubscribeToDatasetRequest *)request;

/**
 <p>Unsubscribes from receiving notifications when a dataset is modified by another device.</p><p>This API can only be called with temporary credentials provided by Cognito Identity. You cannot call this API with developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the UnsubscribeFromDataset service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncUnsubscribeFromDatasetResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorInternalError`, `AWSCognitoSyncErrorInvalidConfiguration`, `AWSCognitoSyncErrorTooManyRequests`.
 
 @see AWSCognitoSyncUnsubscribeFromDatasetRequest
 @see AWSCognitoSyncUnsubscribeFromDatasetResponse
 */
- (AWSTask *)unsubscribeFromDataset:(AWSCognitoSyncUnsubscribeFromDatasetRequest *)request;

/**
 <p>Posts updates to records and adds and deletes records for a dataset and user.</p><p>The sync count in the record patch is your last known sync count for that record. The server will reject an UpdateRecords request with a ResourceConflictException if you try to patch a record with a new value but a stale sync count.</p><p>For example, if the sync count on the server is 5 for a key called highScore and you try and submit a new highScore with sync count of 4, the request will be rejected. To obtain the current sync count for a record, call ListRecords. On a successful update of the record, the response returns the new sync count for that record. You should present that sync count the next time you try to update that same record. When the record does not exist, specify the sync count as 0.</p><p>This API can be called with temporary user credentials provided by Cognito Identity or with developer credentials.</p>
 
 @param request A container for the necessary parameters to execute the UpdateRecords service method.
 
 @return An instance of `AWSTask`. On successful execution, `task.result` will contain an instance of `AWSCognitoSyncUpdateRecordsResponse`. On failed execution, `task.error` may contain an `NSError` with `AWSCognitoSyncErrorDomain` domian and the following error code: `AWSCognitoSyncErrorInvalidParameter`, `AWSCognitoSyncErrorLimitExceeded`, `AWSCognitoSyncErrorNotAuthorized`, `AWSCognitoSyncErrorResourceNotFound`, `AWSCognitoSyncErrorResourceConflict`, `AWSCognitoSyncErrorInvalidLambdaFunctionOutput`, `AWSCognitoSyncErrorLambdaThrottled`, `AWSCognitoSyncErrorTooManyRequests`, `AWSCognitoSyncErrorInternalError`.
 
 @see AWSCognitoSyncUpdateRecordsRequest
 @see AWSCognitoSyncUpdateRecordsResponse
 */
- (AWSTask *)updateRecords:(AWSCognitoSyncUpdateRecordsRequest *)request;

@end
