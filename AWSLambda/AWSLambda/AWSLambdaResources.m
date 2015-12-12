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

#import "AWSLambdaResources.h"
#import "AWSLogging.h"

@interface AWSLambdaResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLambdaResources

+ (instancetype)sharedInstance {
    static AWSLambdaResources *_sharedResources = nil;
    static dispatch_once_t once_token;
    
    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLambdaResources new];
    });
    
    return _sharedResources;
}
- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
  return @" \
  { \
    \"version\":\"2.0\", \
    \"metadata\":{ \
      \"apiVersion\":\"2015-03-31\", \
      \"endpointPrefix\":\"lambda\", \
      \"serviceFullName\":\"AWS Lambda\", \
      \"signatureVersion\":\"v4\", \
      \"protocol\":\"rest-json\" \
    }, \
    \"documentation\":\"<fullname>AWS Lambda</fullname> <p><b>Overview</b></p> <p>This is the <i>AWS Lambda API Reference</i>. The AWS Lambda Developer Guide provides additional information. For the service overview, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/welcome.html\\\">What is AWS Lambda</a>, and for information about how the service works, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a> in the <i>AWS Lambda Developer Guide</i>.</p>\", \
    \"operations\":{ \
      \"AddPermission\":{ \
        \"name\":\"AddPermission\", \
        \"http\":{ \
          \"method\":\"POST\", \
          \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions/HEAD/policy\", \
          \"responseCode\":201 \
        }, \
        \"input\":{\"shape\":\"AddPermissionRequest\"}, \
        \"output\":{\"shape\":\"AddPermissionResponse\"}, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceConflictException\", \
            \"error\":{\"httpStatusCode\":409}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource already exists.</p>\" \
          }, \
          { \
            \"shape\":\"InvalidParameterValueException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
          }, \
          { \
            \"shape\":\"PolicyLengthExceededException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>Lambda function access policy is limited to 20 KB.</p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Adds a permission to the access policy associated with the specified AWS Lambda function. In a \\\"push event\\\" model, the access policy attached to the Lambda function grants Amazon S3 or a user application permission for the Lambda <code>lambda:Invoke</code> action. For information about the push model, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a>. Each Lambda function has one access policy associated with it. You can use the <code>AddPermission</code> API to add a permission to the policy. You have one access policy but it can have multiple permission statements.</p> <p>This operation requires permission for the <code>lambda:AddPermission</code> action.</p>\" \
      }, \
      \"CreateEventSourceMapping\":{ \
        \"name\":\"CreateEventSourceMapping\", \
        \"http\":{ \
          \"method\":\"POST\", \
          \"requestUri\":\"/2015-03-31/event-source-mappings/\", \
          \"responseCode\":202 \
        }, \
        \"input\":{\"shape\":\"CreateEventSourceMappingRequest\"}, \
        \"output\":{ \
          \"shape\":\"EventSourceMappingConfiguration\", \
          \"documentation\":\"<p>Describes mapping between an Amazon Kinesis stream and a Lambda function.</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"InvalidParameterValueException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
          }, \
          { \
            \"shape\":\"ResourceConflictException\", \
            \"error\":{\"httpStatusCode\":409}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource already exists.</p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Identifies a stream as an event source for a Lambda function. It can be either an Amazon Kinesis stream or an Amazon DynamoDB stream. AWS Lambda invokes the specified function when records are posted to the stream.</p> <p>This is the pull model, where AWS Lambda invokes the function. For more information, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a> in the <i>AWS Lambda Developer Guide</i>.</p> <p>This association between an Amazon Kinesis stream and a Lambda function is called the event source mapping. You provide the configuration information (for example, which stream to read from and which Lambda function to invoke) for the event source mapping in the request body.</p> <p> Each event source, such as an Amazon Kinesis or a DynamoDB stream, can be associated with multiple AWS Lambda function. A given Lambda function can be associated with multiple AWS event sources. </p> <p>This operation requires permission for the <code>lambda:CreateEventSourceMapping</code> action.</p>\" \
      }, \
      \"CreateFunction\":{ \
        \"name\":\"CreateFunction\", \
        \"http\":{ \
          \"method\":\"POST\", \
          \"requestUri\":\"/2015-03-31/functions\", \
          \"responseCode\":201 \
        }, \
        \"input\":{\"shape\":\"CreateFunctionRequest\"}, \
        \"output\":{ \
          \"shape\":\"FunctionConfiguration\", \
          \"documentation\":\"<p>A complex type that describes function metadata.</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"InvalidParameterValueException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceConflictException\", \
            \"error\":{\"httpStatusCode\":409}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource already exists.</p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          }, \
          { \
            \"shape\":\"CodeStorageExceededException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Creates a new Lambda function. The function metadata is created from the request parameters, and the code for the function is provided by a .zip file in the request body. If the function name already exists, the operation will fail. Note that the function name is case-sensitive. </p> <p>This operation requires permission for the <code>lambda:CreateFunction</code> action.</p>\" \
      }, \
      \"DeleteEventSourceMapping\":{ \
        \"name\":\"DeleteEventSourceMapping\", \
        \"http\":{ \
          \"method\":\"DELETE\", \
          \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\", \
          \"responseCode\":202 \
        }, \
        \"input\":{\"shape\":\"DeleteEventSourceMappingRequest\"}, \
        \"output\":{ \
          \"shape\":\"EventSourceMappingConfiguration\", \
          \"documentation\":\"<p>Describes mapping between an Amazon Kinesis stream and a Lambda function.</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"InvalidParameterValueException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Removes an event source mapping. This means AWS Lambda will no longer invoke the function for events in the associated source.</p> <p>This operation requires permission for the <code>lambda:DeleteEventSourceMapping</code> action.</p>\" \
      }, \
      \"DeleteFunction\":{ \
        \"name\":\"DeleteFunction\", \
        \"http\":{ \
          \"method\":\"DELETE\", \
          \"requestUri\":\"/2015-03-31/functions/{FunctionName}\", \
          \"responseCode\":204 \
        }, \
        \"input\":{\"shape\":\"DeleteFunctionRequest\"}, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Deletes the specified Lambda function code and configuration.</p> <p>When you delete a function the associated access policy is also deleted. You will need to delete the event source mappings explicitly.</p> <p>This operation requires permission for the <code>lambda:DeleteFunction</code> action.</p>\" \
      }, \
      \"GetEventSourceMapping\":{ \
        \"name\":\"GetEventSourceMapping\", \
        \"http\":{ \
          \"method\":\"GET\", \
          \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\", \
          \"responseCode\":200 \
        }, \
        \"input\":{\"shape\":\"GetEventSourceMappingRequest\"}, \
        \"output\":{ \
          \"shape\":\"EventSourceMappingConfiguration\", \
          \"documentation\":\"<p>Describes mapping between an Amazon Kinesis stream and a Lambda function.</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"InvalidParameterValueException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Returns configuration information for the specified event source mapping (see <a>CreateEventSourceMapping</a>).</p> <p>This operation requires permission for the <code>lambda:GetEventSourceMapping</code> action.</p>\" \
      }, \
      \"GetFunction\":{ \
        \"name\":\"GetFunction\", \
        \"http\":{ \
          \"method\":\"GET\", \
          \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions/HEAD\", \
          \"responseCode\":200 \
        }, \
        \"input\":{\"shape\":\"GetFunctionRequest\"}, \
        \"output\":{ \
          \"shape\":\"GetFunctionResponse\", \
          \"documentation\":\"<p>This response contains the object for the Lambda function location (see <a>API_FunctionCodeLocation</a></p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Returns the configuration information of the Lambda function and a presigned URL link to the .zip file you uploaded with <a>CreateFunction</a> so you can download the .zip file. Note that the URL is valid for up to 10 minutes. The configuration information is the same information you provided as parameters when uploading the function.</p> <p>This operation requires permission for the <code>lambda:GetFunction</code> action.</p>\" \
      }, \
      \"GetFunctionConfiguration\":{ \
        \"name\":\"GetFunctionConfiguration\", \
        \"http\":{ \
          \"method\":\"GET\", \
          \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions/HEAD/configuration\", \
          \"responseCode\":200 \
        }, \
        \"input\":{\"shape\":\"GetFunctionConfigurationRequest\"}, \
        \"output\":{ \
          \"shape\":\"FunctionConfiguration\", \
          \"documentation\":\"<p>A complex type that describes function metadata.</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Returns the configuration information of the Lambda function. This the same information you provided as parameters when uploading the function by using <a>CreateFunction</a>.</p> <p>This operation requires permission for the <code>lambda:GetFunctionConfiguration</code> operation.</p>\" \
      }, \
      \"GetPolicy\":{ \
        \"name\":\"GetPolicy\", \
        \"http\":{ \
          \"method\":\"GET\", \
          \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions/HEAD/policy\", \
          \"responseCode\":200 \
        }, \
        \"input\":{\"shape\":\"GetPolicyRequest\"}, \
        \"output\":{\"shape\":\"GetPolicyResponse\"}, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Returns the access policy, containing a list of permissions granted via the <code>AddPermission</code> API, associated with the specified bucket.</p> <p>You need permission for the <code>lambda:GetPolicy action.</code></p>\" \
      }, \
      \"Invoke\":{ \
        \"name\":\"Invoke\", \
        \"http\":{ \
          \"method\":\"POST\", \
          \"requestUri\":\"/2015-03-31/functions/{FunctionName}/invocations\" \
        }, \
        \"input\":{\"shape\":\"InvocationRequest\"}, \
        \"output\":{ \
          \"shape\":\"InvocationResponse\", \
          \"documentation\":\"<p>Upon success, returns an empty response. Otherwise, throws an exception.</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"InvalidRequestContentException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>The request body could not be parsed as JSON.</p>\" \
          }, \
          { \
            \"shape\":\"RequestTooLargeException\", \
            \"error\":{\"httpStatusCode\":413}, \
            \"exception\":true \
          }, \
          { \
            \"shape\":\"UnsupportedMediaTypeException\", \
            \"error\":{\"httpStatusCode\":415}, \
            \"exception\":true \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p> Invokes a specified Lambda function. </p> <p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>\" \
      }, \
      \"InvokeAsync\":{ \
        \"name\":\"InvokeAsync\", \
        \"http\":{ \
          \"method\":\"POST\", \
          \"requestUri\":\"/2014-11-13/functions/{FunctionName}/invoke-async/\", \
          \"responseCode\":202 \
        }, \
        \"input\":{ \
          \"shape\":\"InvokeAsyncRequest\", \
          \"deprecated\":true \
        }, \
        \"output\":{ \
          \"shape\":\"InvokeAsyncResponse\", \
          \"deprecated\":true, \
          \"documentation\":\"<p>Upon success, it returns empty response. Otherwise, throws an exception.</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"InvalidRequestContentException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>The request body could not be parsed as JSON.</p>\" \
          } \
        ], \
        \"deprecated\":true, \
        \"documentation\":\"<important>This API is deprecated. We recommend you use <code>Invoke</code> API (see <a>Invoke</a>).</important> <p>Submits an invocation request to AWS Lambda. Upon receiving the request, Lambda executes the specified function asynchronously. To see the logs generated by the Lambda function execution, see the CloudWatch logs console.</p> <p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>\" \
      }, \
      \"ListEventSourceMappings\":{ \
        \"name\":\"ListEventSourceMappings\", \
        \"http\":{ \
          \"method\":\"GET\", \
          \"requestUri\":\"/2015-03-31/event-source-mappings/\", \
          \"responseCode\":200 \
        }, \
        \"input\":{\"shape\":\"ListEventSourceMappingsRequest\"}, \
        \"output\":{ \
          \"shape\":\"ListEventSourceMappingsResponse\", \
          \"documentation\":\"<p>Contains a list of event sources (see <a>API_EventSourceMappingConfiguration</a>)</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"InvalidParameterValueException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Returns a list of event source mappings you created using the <code>CreateEventSourceMapping</code> (see <a>CreateEventSourceMapping</a>), where you identify a stream as an event source. This list does not include Amazon S3 event sources. </p> <p>For each mapping, the API returns configuration information. You can optionally specify filters to retrieve specific event source mappings.</p> <p>This operation requires permission for the <code>lambda:ListEventSourceMappings</code> action.</p>\" \
      }, \
      \"ListFunctions\":{ \
        \"name\":\"ListFunctions\", \
        \"http\":{ \
          \"method\":\"GET\", \
          \"requestUri\":\"/2015-03-31/functions/\", \
          \"responseCode\":200 \
        }, \
        \"input\":{\"shape\":\"ListFunctionsRequest\"}, \
        \"output\":{ \
          \"shape\":\"ListFunctionsResponse\", \
          \"documentation\":\"<p>Contains a list of AWS Lambda function configurations (see <a>FunctionConfiguration</a>.</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Returns a list of your Lambda functions. For each function, the response includes the function configuration information. You must use <a>GetFunction</a> to retrieve the code for your function.</p> <p>This operation requires permission for the <code>lambda:ListFunctions</code> action.</p>\" \
      }, \
      \"RemovePermission\":{ \
        \"name\":\"RemovePermission\", \
        \"http\":{ \
          \"method\":\"DELETE\", \
          \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions/HEAD/policy/{StatementId}\", \
          \"responseCode\":204 \
        }, \
        \"input\":{\"shape\":\"RemovePermissionRequest\"}, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>You can remove individual permissions from an access policy associated with a Lambda function by providing a Statement ID. </p> <p>Note that removal of a permission will cause an active event source to lose permission to the function. </p> <p>You need permission for the <code>lambda:RemovePermission</code> action.</p>\" \
      }, \
      \"UpdateEventSourceMapping\":{ \
        \"name\":\"UpdateEventSourceMapping\", \
        \"http\":{ \
          \"method\":\"PUT\", \
          \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\", \
          \"responseCode\":202 \
        }, \
        \"input\":{\"shape\":\"UpdateEventSourceMappingRequest\"}, \
        \"output\":{ \
          \"shape\":\"EventSourceMappingConfiguration\", \
          \"documentation\":\"<p>Describes mapping between an Amazon Kinesis stream and a Lambda function.</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"InvalidParameterValueException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>You can update an event source mapping. This is useful if you want to change the parameters of the existing mapping without losing your position in the stream. You can change which function will receive the stream records, but to change the stream itself, you must create a new mapping. </p> <p>This operation requires permission for the <code>lambda:UpdateEventSourceMapping</code> action.</p>\" \
      }, \
      \"UpdateFunctionCode\":{ \
        \"name\":\"UpdateFunctionCode\", \
        \"http\":{ \
          \"method\":\"PUT\", \
          \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions/HEAD/code\", \
          \"responseCode\":200 \
        }, \
        \"input\":{\"shape\":\"UpdateFunctionCodeRequest\"}, \
        \"output\":{ \
          \"shape\":\"FunctionConfiguration\", \
          \"documentation\":\"<p>A complex type that describes function metadata.</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"InvalidParameterValueException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          }, \
          { \
            \"shape\":\"CodeStorageExceededException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p> Updates the code for the specified Lambda function. This operation must only be used on an existing Lambda function and cannot be used to update the function configuration. </p> <p>This operation requires permission for the <code>lambda:UpdateFunctionCode</code> action.</p>\" \
      }, \
      \"UpdateFunctionConfiguration\":{ \
        \"name\":\"UpdateFunctionConfiguration\", \
        \"http\":{ \
          \"method\":\"PUT\", \
          \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions/HEAD/configuration\", \
          \"responseCode\":200 \
        }, \
        \"input\":{\"shape\":\"UpdateFunctionConfigurationRequest\"}, \
        \"output\":{ \
          \"shape\":\"FunctionConfiguration\", \
          \"documentation\":\"<p>A complex type that describes function metadata.</p>\" \
        }, \
        \"errors\":[ \
          { \
            \"shape\":\"ServiceException\", \
            \"error\":{\"httpStatusCode\":500}, \
            \"exception\":true, \
            \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
          }, \
          { \
            \"shape\":\"ResourceNotFoundException\", \
            \"error\":{\"httpStatusCode\":404}, \
            \"exception\":true, \
            \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
          }, \
          { \
            \"shape\":\"InvalidParameterValueException\", \
            \"error\":{\"httpStatusCode\":400}, \
            \"exception\":true, \
            \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
          }, \
          { \
            \"shape\":\"TooManyRequestsException\", \
            \"error\":{\"httpStatusCode\":429}, \
            \"exception\":true \
          } \
        ], \
        \"documentation\":\"<p>Updates the configuration parameters for the specified Lambda function by using the values provided in the request. You provide only the parameters you want to change. This operation must only be used on an existing Lambda function and cannot be used to update the function's code. </p> <p>This operation requires permission for the <code>lambda:UpdateFunctionConfiguration</code> action.</p>\" \
      } \
    }, \
    \"shapes\":{ \
      \"Action\":{ \
        \"type\":\"string\", \
        \"pattern\":\"(lambda:[*]|lambda:[a-zA-Z]+|[*])\" \
      }, \
      \"AddPermissionRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[ \
          \"FunctionName\", \
          \"StatementId\", \
          \"Action\", \
          \"Principal\" \
        ], \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"location\":\"uri\", \
            \"locationName\":\"FunctionName\", \
            \"documentation\":\"<p>Name of the Lambda function whose access policy you are updating by adding a new permission.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          }, \
          \"StatementId\":{ \
            \"shape\":\"StatementId\", \
            \"documentation\":\"<p>A unique statement identifier.</p>\" \
          }, \
          \"Action\":{ \
            \"shape\":\"Action\", \
            \"documentation\":\"<p>The AWS Lambda action you want to allow in this statement. Each Lambda action is a string starting with \\\"lambda:\\\" followed by the API name (see <a>Operations</a>). For example, \\\"lambda:CreateFunction\\\". You can use wildcard (\\\"lambda:*\\\") to grant permission for all AWS Lambda actions. </p>\" \
          }, \
          \"Principal\":{ \
            \"shape\":\"Principal\", \
            \"documentation\":\"<p>The principal who is getting this permission. It can be Amazon S3 service Principal (\\\"s3.amazonaws.com\\\") if you want Amazon S3 to invoke the function, an AWS account ID if you are granting cross-account permission, or any valid AWS service principal such as \\\"sns.amazonaws.com\\\". For example, you might want to allow a custom application in another AWS account to push events to AWS Lambda by invoking your function. </p>\" \
          }, \
          \"SourceArn\":{ \
            \"shape\":\"Arn\", \
            \"documentation\":\"<p>This is optional; however, when granting Amazon S3 permission to invoke your function, you should specify this field with the bucket Amazon Resource Name (ARN) as its value. This ensures that only events generated from the specified bucket can invoke the function. </p> <important>If you add a permission for the Amazon S3 principal without providing the source ARN, any AWS account that creates a mapping to your function ARN can send events to invoke your Lambda function from Amazon S3.</important>\" \
          }, \
          \"SourceAccount\":{ \
            \"shape\":\"SourceOwner\", \
            \"documentation\":\"<p>The AWS account ID (without a hyphen) of the source owner. If the <code>SourceArn</code> identifies a bucket, then this is the bucket owner's account ID. You can use this additional condition to ensure the bucket you specify is owned by a specific account (it is possible the bucket owner deleted the bucket and some other AWS account created the bucket). You can also use this condition to specify all sources (that is, you don't specify the <code>SourceArn</code>) owned by a specific account. </p>\" \
          } \
        } \
      }, \
      \"AddPermissionResponse\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Statement\":{ \
            \"shape\":\"String\", \
            \"documentation\":\"<p>The permission statement you specified in the request. The response returns the same as a string using \\\"\\\\\\\" as an escape character in the JSON. </p>\" \
          } \
        } \
      }, \
      \"Arn\":{ \
        \"type\":\"string\", \
        \"pattern\":\"arn:aws:([a-zA-Z0-9\\\\-])+:([a-z]{2}-[a-z]+-\\\\d{1})?:(\\\\d{12})?:(.*)\" \
      }, \
      \"BatchSize\":{ \
        \"type\":\"integer\", \
        \"min\":1, \
        \"max\":10000 \
      }, \
      \"Blob\":{\"type\":\"blob\"}, \
      \"BlobStream\":{ \
        \"type\":\"blob\", \
        \"streaming\":true \
      }, \
      \"CodeStorageExceededException\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Type\":{\"shape\":\"String\"}, \
          \"message\":{\"shape\":\"String\"} \
        }, \
        \"error\":{\"httpStatusCode\":400}, \
        \"exception\":true \
      }, \
      \"CreateEventSourceMappingRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[ \
          \"EventSourceArn\", \
          \"FunctionName\", \
          \"StartingPosition\" \
        ], \
        \"members\":{ \
          \"EventSourceArn\":{ \
            \"shape\":\"Arn\", \
            \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis or the Amazon DynamoDB stream that is the event source. Any record added to this stream could cause AWS Lambda to invoke your Lambda function, it depends on the <code>BatchSize</code>. AWS Lambda POSTs the Amazon Kinesis event, containing records, to your Lambda function as JSON.</p>\" \
          }, \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"documentation\":\"<p>The Lambda function to invoke when AWS Lambda detects an event on the stream.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          }, \
          \"Enabled\":{ \
            \"shape\":\"Enabled\", \
            \"documentation\":\"<p>Indicates whether AWS Lambda should begin polling the event source. </p>\" \
          }, \
          \"BatchSize\":{ \
            \"shape\":\"BatchSize\", \
            \"documentation\":\"<p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records. The default is 100 records.</p>\" \
          }, \
          \"StartingPosition\":{ \
            \"shape\":\"EventSourcePosition\", \
            \"documentation\":\"<p>The position in the stream where AWS Lambda should start reading. For more information, go to <a href=\\\"http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetShardIterator.html#Kinesis-GetShardIterator-request-ShardIteratorType\\\">ShardIteratorType</a> in the <i>Amazon Kinesis API Reference</i>. </p>\" \
          } \
        } \
      }, \
      \"CreateFunctionRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[ \
          \"FunctionName\", \
          \"Runtime\", \
          \"Role\", \
          \"Handler\", \
          \"Code\" \
        ], \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"documentation\":\"<p>The name you want to assign to the function you are uploading. You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. The function names appear in the console and are returned in the <a>ListFunctions</a> API. Function names are used to specify functions to other AWS Lambda APIs, such as <a>Invoke</a>. </p>\" \
          }, \
          \"Runtime\":{ \
            \"shape\":\"Runtime\", \
            \"documentation\":\"<p>The runtime environment for the Lambda function you are uploading. Currently, Lambda supports only \\\"nodejs\\\" as the runtime.</p>\" \
          }, \
          \"Role\":{ \
            \"shape\":\"RoleArn\", \
            \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Lambda assumes when it executes your function to access any other Amazon Web Services (AWS) resources. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a> </p>\" \
          }, \
          \"Handler\":{ \
            \"shape\":\"Handler\", \
            \"documentation\":\"<p>The function within your code that Lambda calls to begin execution. For Node.js, it is the <i>module-name</i>.<i>export</i> value in your function. </p>\" \
          }, \
          \"Description\":{ \
            \"shape\":\"Description\", \
            \"documentation\":\"<p>A short, user-defined function description. Lambda does not use this value. Assign a meaningful description as you see fit.</p>\" \
          }, \
          \"Timeout\":{ \
            \"shape\":\"Timeout\", \
            \"documentation\":\"<p>The function execution time at which Lambda should terminate the function. Because the execution time has cost implications, we recommend you set this value based on your expected execution time. The default is 3 seconds. </p>\" \
          }, \
          \"MemorySize\":{ \
            \"shape\":\"MemorySize\", \
            \"documentation\":\"<p>The amount of memory, in MB, your Lambda function is given. Lambda uses this memory size to infer the amount of CPU and memory allocated to your function. Your function use-case determines your CPU and memory requirements. For example, a database operation might need less memory compared to an image processing function. The default value is 128 MB. The value must be a multiple of 64 MB.</p>\" \
          }, \
          \"Code\":{ \
            \"shape\":\"FunctionCode\", \
            \"documentation\":\"<p>The code for the Lambda function. </p>\" \
          } \
        } \
      }, \
      \"Date\":{\"type\":\"timestamp\"}, \
      \"DeleteEventSourceMappingRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[\"UUID\"], \
        \"members\":{ \
          \"UUID\":{ \
            \"shape\":\"String\", \
            \"location\":\"uri\", \
            \"locationName\":\"UUID\", \
            \"documentation\":\"<p>The event source mapping ID.</p>\" \
          } \
        } \
      }, \
      \"DeleteFunctionRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[\"FunctionName\"], \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"location\":\"uri\", \
            \"locationName\":\"FunctionName\", \
            \"documentation\":\"<p>The Lambda function to delete.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          } \
        } \
      }, \
      \"Description\":{ \
        \"type\":\"string\", \
        \"min\":0, \
        \"max\":256 \
      }, \
      \"Enabled\":{\"type\":\"boolean\"}, \
      \"EventSourceMappingConfiguration\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"UUID\":{ \
            \"shape\":\"String\", \
            \"documentation\":\"<p>The AWS Lambda assigned opaque identifier for the mapping.</p>\" \
          }, \
          \"BatchSize\":{ \
            \"shape\":\"BatchSize\", \
            \"documentation\":\"<p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records.</p>\" \
          }, \
          \"EventSourceArn\":{ \
            \"shape\":\"Arn\", \
            \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis stream that is the source of events.</p>\" \
          }, \
          \"FunctionArn\":{ \
            \"shape\":\"FunctionArn\", \
            \"documentation\":\"<p>The Lambda function to invoke when AWS Lambda detects an event on the stream.</p>\" \
          }, \
          \"LastModified\":{ \
            \"shape\":\"Date\", \
            \"documentation\":\"<p>The UTC time string indicating the last time the event mapping was updated.</p>\" \
          }, \
          \"LastProcessingResult\":{ \
            \"shape\":\"String\", \
            \"documentation\":\"<p>The result of the last AWS Lambda invocation of your Lambda function.</p>\" \
          }, \
          \"State\":{ \
            \"shape\":\"String\", \
            \"documentation\":\"<p>The state of the event source mapping. It can be \\\"Creating\\\", \\\"Enabled\\\", \\\"Disabled\\\", \\\"Enabling\\\", \\\"Disabling\\\", \\\"Updating\\\", or \\\"Deleting\\\".</p>\" \
          }, \
          \"StateTransitionReason\":{ \
            \"shape\":\"String\", \
            \"documentation\":\"<p>The reason the event source mapping is in its current state. It is either user-requested or an AWS Lambda-initiated state transition.</p>\" \
          } \
        }, \
        \"documentation\":\"<p>Describes mapping between an Amazon Kinesis stream and a Lambda function.</p>\" \
      }, \
      \"EventSourceMappingsList\":{ \
        \"type\":\"list\", \
        \"member\":{\"shape\":\"EventSourceMappingConfiguration\"} \
      }, \
      \"EventSourcePosition\":{ \
        \"type\":\"string\", \
        \"enum\":[ \
          \"TRIM_HORIZON\", \
          \"LATEST\" \
        ] \
      }, \
      \"FunctionArn\":{ \
        \"type\":\"string\", \
        \"pattern\":\"arn:aws:lambda:[a-z]{2}-[a-z]+-\\\\d{1}:\\\\d{12}:function:[a-zA-Z0-9-_]+(\\\\/[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})?\" \
      }, \
      \"FunctionCode\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"ZipFile\":{ \
            \"shape\":\"Blob\", \
            \"documentation\":\"<p>A base64-encoded .zip file containing your deployment package. For more information about creating a .zip file, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role.html\\\">Execution Permissions</a> in the <i>AWS Lambda Developer Guide</i>. </p>\" \
          }, \
          \"S3Bucket\":{ \
            \"shape\":\"S3Bucket\", \
            \"documentation\":\"<p>Amazon S3 bucket name where the .zip file containing your deployment package is stored. This bucket must reside in the same AWS region where you are creating the Lambda function. </p>\" \
          }, \
          \"S3Key\":{ \
            \"shape\":\"S3Key\", \
            \"documentation\":\"<p>The Amazon S3 object (the deployment package) key name you want to upload. </p>\" \
          }, \
          \"S3ObjectVersion\":{ \
            \"shape\":\"S3ObjectVersion\", \
            \"documentation\":\"<p>The Amazon S3 object (the deployment package) version you want to upload.</p>\" \
          } \
        }, \
        \"documentation\":\"<p>The code for the Lambda function.</p>\" \
      }, \
      \"FunctionCodeLocation\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"RepositoryType\":{ \
            \"shape\":\"String\", \
            \"documentation\":\"<p>The repository from which you can download the function.</p>\" \
          }, \
          \"Location\":{ \
            \"shape\":\"String\", \
            \"documentation\":\"<p>The presigned URL you can use to download the function's .zip file that you previously uploaded. The URL is valid for up to 10 minutes.</p>\" \
          } \
        }, \
        \"documentation\":\"<p>The object for the Lambda function location.</p>\" \
      }, \
      \"FunctionConfiguration\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"documentation\":\"<p>The name of the function.</p>\" \
          }, \
          \"FunctionArn\":{ \
            \"shape\":\"FunctionArn\", \
            \"documentation\":\"<p>The Amazon Resource Name (ARN) assigned to the function.</p>\" \
          }, \
          \"Runtime\":{ \
            \"shape\":\"Runtime\", \
            \"documentation\":\"<p>The runtime environment for the Lambda function.</p>\" \
          }, \
          \"Role\":{ \
            \"shape\":\"RoleArn\", \
            \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Lambda assumes when it executes your function to access any other Amazon Web Services (AWS) resources. </p>\" \
          }, \
          \"Handler\":{ \
            \"shape\":\"Handler\", \
            \"documentation\":\"<p>The function Lambda calls to begin executing your function.</p>\" \
          }, \
          \"CodeSize\":{ \
            \"shape\":\"Long\", \
            \"documentation\":\"<p>The size, in bytes, of the function .zip file you uploaded.</p>\" \
          }, \
          \"Description\":{ \
            \"shape\":\"Description\", \
            \"documentation\":\"<p>The user-provided description.</p>\" \
          }, \
          \"Timeout\":{ \
            \"shape\":\"Timeout\", \
            \"documentation\":\"<p>The function execution time at which Lambda should terminate the function. Because the execution time has cost implications, we recommend you set this value based on your expected execution time. The default is 3 seconds. </p>\" \
          }, \
          \"MemorySize\":{ \
            \"shape\":\"MemorySize\", \
            \"documentation\":\"<p>The memory size, in MB, you configured for the function. Must be a multiple of 64 MB.</p>\" \
          }, \
          \"LastModified\":{ \
            \"shape\":\"Timestamp\", \
            \"documentation\":\"<p>The timestamp of the last time you updated the function.</p>\" \
          } \
        }, \
        \"documentation\":\"<p>A complex type that describes function metadata.</p>\" \
      }, \
      \"FunctionList\":{ \
        \"type\":\"list\", \
        \"member\":{\"shape\":\"FunctionConfiguration\"} \
      }, \
      \"FunctionName\":{ \
        \"type\":\"string\", \
        \"min\":1, \
        \"max\":111, \
        \"pattern\":\"(arn:aws:lambda:)?([a-z]{2}-[a-z]+-\\\\d{1}:)?(\\\\d{12}:)?(function:)?([a-zA-Z0-9-_]+)\" \
      }, \
      \"GetEventSourceMappingRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[\"UUID\"], \
        \"members\":{ \
          \"UUID\":{ \
            \"shape\":\"String\", \
            \"location\":\"uri\", \
            \"locationName\":\"UUID\", \
            \"documentation\":\"<p>The AWS Lambda assigned ID of the event source mapping.</p>\" \
          } \
        } \
      }, \
      \"GetFunctionConfigurationRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[\"FunctionName\"], \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"location\":\"uri\", \
            \"locationName\":\"FunctionName\", \
            \"documentation\":\"<p>The name of the Lambda function for which you want to retrieve the configuration information.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          } \
        } \
      }, \
      \"GetFunctionRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[\"FunctionName\"], \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"location\":\"uri\", \
            \"locationName\":\"FunctionName\", \
            \"documentation\":\"<p>The Lambda function name. </p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          } \
        } \
      }, \
      \"GetFunctionResponse\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Configuration\":{\"shape\":\"FunctionConfiguration\"}, \
          \"Code\":{\"shape\":\"FunctionCodeLocation\"} \
        }, \
        \"documentation\":\"<p>This response contains the object for the Lambda function location (see <a>API_FunctionCodeLocation</a></p>\" \
      }, \
      \"GetPolicyRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[\"FunctionName\"], \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"location\":\"uri\", \
            \"locationName\":\"FunctionName\", \
            \"documentation\":\"<p>Function name whose access policy you want to retrieve. </p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          } \
        } \
      }, \
      \"GetPolicyResponse\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Policy\":{ \
            \"shape\":\"String\", \
            \"documentation\":\"<p>The access policy associated with the specified function. The response returns the same as a string using \\\"\\\\\\\" as an escape character in the JSON. </p>\" \
          } \
        } \
      }, \
      \"Handler\":{ \
        \"type\":\"string\", \
        \"max\":128, \
        \"pattern\":\"[^\\\\s]+\" \
      }, \
      \"HttpStatus\":{\"type\":\"integer\"}, \
      \"Integer\":{\"type\":\"integer\"}, \
      \"InvalidParameterValueException\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Type\":{\"shape\":\"String\"}, \
          \"message\":{\"shape\":\"String\"} \
        }, \
        \"error\":{\"httpStatusCode\":400}, \
        \"exception\":true, \
        \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\" \
      }, \
      \"InvalidRequestContentException\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Type\":{\"shape\":\"String\"}, \
          \"message\":{\"shape\":\"String\"} \
        }, \
        \"error\":{\"httpStatusCode\":400}, \
        \"exception\":true, \
        \"documentation\":\"<p>The request body could not be parsed as JSON.</p>\" \
      }, \
      \"InvocationRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[\"FunctionName\"], \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"location\":\"uri\", \
            \"locationName\":\"FunctionName\", \
            \"documentation\":\"<p>The Lambda function name. </p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          }, \
          \"InvocationType\":{ \
            \"shape\":\"InvocationType\", \
            \"location\":\"header\", \
            \"locationName\":\"X-Amz-Invocation-Type\", \
            \"documentation\":\"<p>By default, the <code>Invoke</code> API assumes \\\"RequestResponse\\\" invocation type. You can optionally request asynchronous execution by specifying \\\"Event\\\" as the <code>InvocationType</code>. You can also use this parameter to request AWS Lambda to not execute the function but do some verification, such as if the caller is authorized to invoke the function and if the inputs are valid. You request this by specifying \\\"DryRun\\\" as the <code>InvocationType</code>. This is useful in a cross-account scenario when you want to verify access to a function without running it. </p>\" \
          }, \
          \"LogType\":{ \
            \"shape\":\"LogType\", \
            \"location\":\"header\", \
            \"locationName\":\"X-Amz-Log-Type\", \
            \"documentation\":\"<p>You can set this optional parameter to \\\"Tail\\\" in the request only if you specify the <code>InvocationType</code> parameter with value \\\"RequestResponse\\\". In this case, AWS Lambda returns the base64-encoded last 4 KB of log data produced by your Lambda function in the <code>x-amz-log-results</code> header. </p>\" \
          }, \
          \"ClientContext\":{ \
            \"shape\":\"String\", \
            \"location\":\"header\", \
            \"locationName\":\"X-Amz-Client-Context\", \
            \"documentation\":\"<p>Using the <code>ClientContext</code> you can pass client-specific information to the Lambda function you are invoking. You can then process the client information in your Lambda function as you choose through the context variable. For an example of a ClientContext JSON, go to <a href=\\\"http://docs.aws.amazon.com/mobileanalytics/latest/ug/PutEvents.html\\\">PutEvents</a> in the <i>Amazon Mobile Analytics API Reference and User Guide</i>.</p> <p>The ClientContext JSON must be base64-encoded.</p>\" \
          }, \
          \"Payload\":{ \
            \"shape\":\"Blob\", \
            \"documentation\":\"<p>JSON that you want to provide to your Lambda function as input.</p>\" \
          } \
        }, \
        \"payload\":\"Payload\" \
      }, \
      \"InvocationResponse\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"StatusCode\":{ \
            \"shape\":\"Integer\", \
            \"location\":\"statusCode\", \
            \"documentation\":\"<p>The HTTP status code will be in the 200 range for successful request. For the \\\"RequestResonse\\\" invocation type this status code will be 200. For the \\\"Event\\\" invocation type this status code will be 202. For the \\\"DryRun\\\" invocation type the status code will be 204. </p>\" \
          }, \
          \"FunctionError\":{ \
            \"shape\":\"String\", \
            \"location\":\"header\", \
            \"locationName\":\"X-Amz-Function-Error\", \
            \"documentation\":\"<p>Indicates whether an error occurred while executing the Lambda function. If an error occurred this field will have one of two values; <code>Handled</code> or <code>Unhandled</code>. <code>Handled</code> errors are errors that are reported by the function while the <code>Unhandled</code> errors are those detected and reported by AWS Lambda. Unhandled errors include out of memory errors and function timeouts. For information about how to report an <code>Handled</code> error, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/programming-model.html\\\">Programming Model</a>. </p>\" \
          }, \
          \"LogResult\":{ \
            \"shape\":\"String\", \
            \"location\":\"header\", \
            \"locationName\":\"X-Amz-Log-Result\", \
            \"documentation\":\"<p> It is the base64-encoded logs for the Lambda function invocation. This is present only if the invocation type is \\\"RequestResponse\\\" and the logs were requested. </p>\" \
          }, \
          \"Payload\":{ \
            \"shape\":\"Blob\", \
            \"documentation\":\"<p> It is the JSON representation of the object returned by the Lambda function. In This is present only if the invocation type is \\\"RequestResponse\\\". </p> <p>In the event of a function error this field contains a message describing the error. For the <code>Handled</code> errors the Lambda function will report this message. For <code>Unhandled</code> errors AWS Lambda reports the message. </p>\" \
          } \
        }, \
        \"documentation\":\"<p>Upon success, returns an empty response. Otherwise, throws an exception.</p>\", \
        \"payload\":\"Payload\" \
      }, \
      \"InvocationType\":{ \
        \"type\":\"string\", \
        \"enum\":[ \
          \"Event\", \
          \"RequestResponse\", \
          \"DryRun\" \
        ] \
      }, \
      \"InvokeAsyncRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[ \
          \"FunctionName\", \
          \"InvokeArgs\" \
        ], \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"location\":\"uri\", \
            \"locationName\":\"FunctionName\", \
            \"documentation\":\"<p>The Lambda function name.</p>\" \
          }, \
          \"InvokeArgs\":{ \
            \"shape\":\"BlobStream\", \
            \"documentation\":\"<p>JSON that you want to provide to your Lambda function as input.</p>\" \
          } \
        }, \
        \"deprecated\":true, \
        \"payload\":\"InvokeArgs\" \
      }, \
      \"InvokeAsyncResponse\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Status\":{ \
            \"shape\":\"HttpStatus\", \
            \"location\":\"statusCode\", \
            \"documentation\":\"<p>It will be 202 upon success.</p>\" \
          } \
        }, \
        \"deprecated\":true, \
        \"documentation\":\"<p>Upon success, it returns empty response. Otherwise, throws an exception.</p>\" \
      }, \
      \"ListEventSourceMappingsRequest\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"EventSourceArn\":{ \
            \"shape\":\"Arn\", \
            \"location\":\"querystring\", \
            \"locationName\":\"EventSourceArn\", \
            \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis stream.</p>\" \
          }, \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"location\":\"querystring\", \
            \"locationName\":\"FunctionName\", \
            \"documentation\":\"<p>The name of the Lambda function.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          }, \
          \"Marker\":{ \
            \"shape\":\"String\", \
            \"location\":\"querystring\", \
            \"locationName\":\"Marker\", \
            \"documentation\":\"<p>Optional string. An opaque pagination token returned from a previous <code>ListEventSourceMappings</code> operation. If present, specifies to continue the list from where the returning call left off. </p>\" \
          }, \
          \"MaxItems\":{ \
            \"shape\":\"MaxListItems\", \
            \"location\":\"querystring\", \
            \"locationName\":\"MaxItems\", \
            \"documentation\":\"<p>Optional integer. Specifies the maximum number of event sources to return in response. This value must be greater than 0.</p>\" \
          } \
        } \
      }, \
      \"ListEventSourceMappingsResponse\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"NextMarker\":{ \
            \"shape\":\"String\", \
            \"documentation\":\"<p>A string, present if there are more event source mappings.</p>\" \
          }, \
          \"EventSourceMappings\":{ \
            \"shape\":\"EventSourceMappingsList\", \
            \"documentation\":\"<p>An array of <code>EventSourceMappingConfiguration</code> objects.</p>\" \
          } \
        }, \
        \"documentation\":\"<p>Contains a list of event sources (see <a>API_EventSourceMappingConfiguration</a>)</p>\" \
      }, \
      \"ListFunctionsRequest\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Marker\":{ \
            \"shape\":\"String\", \
            \"location\":\"querystring\", \
            \"locationName\":\"Marker\", \
            \"documentation\":\"<p>Optional string. An opaque pagination token returned from a previous <code>ListFunctions</code> operation. If present, indicates where to continue the listing. </p>\" \
          }, \
          \"MaxItems\":{ \
            \"shape\":\"MaxListItems\", \
            \"location\":\"querystring\", \
            \"locationName\":\"MaxItems\", \
            \"documentation\":\"<p>Optional integer. Specifies the maximum number of AWS Lambda functions to return in response. This parameter value must be greater than 0.</p>\" \
          } \
        } \
      }, \
      \"ListFunctionsResponse\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"NextMarker\":{ \
            \"shape\":\"String\", \
            \"documentation\":\"<p>A string, present if there are more functions.</p>\" \
          }, \
          \"Functions\":{ \
            \"shape\":\"FunctionList\", \
            \"documentation\":\"<p>A list of Lambda functions.</p>\" \
          } \
        }, \
        \"documentation\":\"<p>Contains a list of AWS Lambda function configurations (see <a>FunctionConfiguration</a>.</p>\" \
      }, \
      \"LogType\":{ \
        \"type\":\"string\", \
        \"enum\":[ \
          \"None\", \
          \"Tail\" \
        ] \
      }, \
      \"Long\":{\"type\":\"long\"}, \
      \"MaxListItems\":{ \
        \"type\":\"integer\", \
        \"min\":1, \
        \"max\":10000 \
      }, \
      \"MemorySize\":{ \
        \"type\":\"integer\", \
        \"min\":128, \
        \"max\":1536 \
      }, \
      \"PolicyLengthExceededException\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Type\":{\"shape\":\"String\"}, \
          \"message\":{\"shape\":\"String\"} \
        }, \
        \"error\":{\"httpStatusCode\":400}, \
        \"exception\":true, \
        \"documentation\":\"<p>Lambda function access policy is limited to 20 KB.</p>\" \
      }, \
      \"Principal\":{ \
        \"type\":\"string\", \
        \"pattern\":\".*\" \
      }, \
      \"RemovePermissionRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[ \
          \"FunctionName\", \
          \"StatementId\" \
        ], \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"location\":\"uri\", \
            \"locationName\":\"FunctionName\", \
            \"documentation\":\"<p>Lambda function whose access policy you want to remove a permission from.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          }, \
          \"StatementId\":{ \
            \"shape\":\"StatementId\", \
            \"location\":\"uri\", \
            \"locationName\":\"StatementId\", \
            \"documentation\":\"<p>Statement ID of the permission to remove.</p>\" \
          } \
        } \
      }, \
      \"RequestTooLargeException\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Type\":{\"shape\":\"String\"}, \
          \"message\":{\"shape\":\"String\"} \
        }, \
        \"error\":{\"httpStatusCode\":413}, \
        \"exception\":true \
      }, \
      \"ResourceConflictException\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Type\":{\"shape\":\"String\"}, \
          \"message\":{\"shape\":\"String\"} \
        }, \
        \"error\":{\"httpStatusCode\":409}, \
        \"exception\":true, \
        \"documentation\":\"<p>The resource already exists.</p>\" \
      }, \
      \"ResourceNotFoundException\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Type\":{\"shape\":\"String\"}, \
          \"Message\":{\"shape\":\"String\"} \
        }, \
        \"error\":{\"httpStatusCode\":404}, \
        \"exception\":true, \
        \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\" \
      }, \
      \"RoleArn\":{ \
        \"type\":\"string\", \
        \"pattern\":\"arn:aws:iam::\\\\d{12}:role/?[a-zA-Z_0-9+=,.@\\\\-_/]+\" \
      }, \
      \"Runtime\":{ \
        \"type\":\"string\", \
        \"enum\":[\"nodejs\"] \
      }, \
      \"S3Bucket\":{ \
        \"type\":\"string\", \
        \"min\":3, \
        \"max\":63, \
        \"pattern\":\"^[0-9A-Za-z\\\\.\\\\-_]*(?<!\\\\.)$\" \
      }, \
      \"S3Key\":{ \
        \"type\":\"string\", \
        \"min\":1, \
        \"max\":1024 \
      }, \
      \"S3ObjectVersion\":{ \
        \"type\":\"string\", \
        \"min\":1, \
        \"max\":1024 \
      }, \
      \"ServiceException\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Type\":{\"shape\":\"String\"}, \
          \"Message\":{\"shape\":\"String\"} \
        }, \
        \"error\":{\"httpStatusCode\":500}, \
        \"exception\":true, \
        \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\" \
      }, \
      \"SourceOwner\":{ \
        \"type\":\"string\", \
        \"pattern\":\"\\\\d{12}\" \
      }, \
      \"StatementId\":{ \
        \"type\":\"string\", \
        \"min\":1, \
        \"max\":100, \
        \"pattern\":\"([a-zA-Z0-9-_]+)\" \
      }, \
      \"String\":{\"type\":\"string\"}, \
      \"Timeout\":{ \
        \"type\":\"integer\", \
        \"min\":1, \
        \"max\":60 \
      }, \
      \"Timestamp\":{\"type\":\"string\"}, \
      \"TooManyRequestsException\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"retryAfterSeconds\":{ \
            \"shape\":\"String\", \
            \"location\":\"header\", \
            \"locationName\":\"Retry-After\", \
            \"documentation\":\"<p>The number of seconds the caller should wait before retrying.</p>\" \
          }, \
          \"Type\":{\"shape\":\"String\"}, \
          \"message\":{\"shape\":\"String\"} \
        }, \
        \"error\":{\"httpStatusCode\":429}, \
        \"exception\":true \
      }, \
      \"UnsupportedMediaTypeException\":{ \
        \"type\":\"structure\", \
        \"members\":{ \
          \"Type\":{\"shape\":\"String\"}, \
          \"message\":{\"shape\":\"String\"} \
        }, \
        \"error\":{\"httpStatusCode\":415}, \
        \"exception\":true \
      }, \
      \"UpdateEventSourceMappingRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[\"UUID\"], \
        \"members\":{ \
          \"UUID\":{ \
            \"shape\":\"String\", \
            \"location\":\"uri\", \
            \"locationName\":\"UUID\", \
            \"documentation\":\"<p>The event source mapping identifier.</p>\" \
          }, \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"documentation\":\"<p>The Lambda function to which you want the stream records sent.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          }, \
          \"Enabled\":{ \
            \"shape\":\"Enabled\", \
            \"documentation\":\"<p>Specifies whether AWS Lambda should actively poll the stream or not. If disabled, AWS Lambda will not poll the stream.</p>\" \
          }, \
          \"BatchSize\":{ \
            \"shape\":\"BatchSize\", \
            \"documentation\":\"<p>The maximum number of stream records that can be sent to your Lambda function for a single invocation.</p>\" \
          } \
        } \
      }, \
      \"UpdateFunctionCodeRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[\"FunctionName\"], \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"location\":\"uri\", \
            \"locationName\":\"FunctionName\", \
            \"documentation\":\"<p>The existing Lambda function name whose code you want to replace.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          }, \
          \"ZipFile\":{ \
            \"shape\":\"Blob\", \
            \"documentation\":\"<p>Based64-encoded .zip file containing your packaged source code.</p>\" \
          }, \
          \"S3Bucket\":{ \
            \"shape\":\"S3Bucket\", \
            \"documentation\":\"<p>Amazon S3 bucket name where the .zip file containing your deployment package is stored. This bucket must reside in the same AWS region where you are creating the Lambda function.</p>\" \
          }, \
          \"S3Key\":{ \
            \"shape\":\"S3Key\", \
            \"documentation\":\"<p>The Amazon S3 object (the deployment package) key name you want to upload. </p>\" \
          }, \
          \"S3ObjectVersion\":{ \
            \"shape\":\"S3ObjectVersion\", \
            \"documentation\":\"<p>The Amazon S3 object (the deployment package) version you want to upload.</p>\" \
          } \
        } \
      }, \
      \"UpdateFunctionConfigurationRequest\":{ \
        \"type\":\"structure\", \
        \"required\":[\"FunctionName\"], \
        \"members\":{ \
          \"FunctionName\":{ \
            \"shape\":\"FunctionName\", \
            \"location\":\"uri\", \
            \"locationName\":\"FunctionName\", \
            \"documentation\":\"<p>The name of the Lambda function.</p> <p> You can specify an unqualified function name (for example, \\\"Thumbnail\\\") or you can specify Amazon Resource Name (ARN) of the function (for example, \\\"arn:aws:lambda:us-west-2:account-id:function:ThumbNail\\\"). AWS Lambda also allows you to specify only the account ID qualifier (for example, \\\"account-id:Thumbnail\\\"). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\" \
          }, \
          \"Role\":{ \
            \"shape\":\"RoleArn\", \
            \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Lambda will assume when it executes your function. </p>\" \
          }, \
          \"Handler\":{ \
            \"shape\":\"Handler\", \
            \"documentation\":\"<p>The function that Lambda calls to begin executing your function. For Node.js, it is the <i>module-name.export</i> value in your function. </p>\" \
          }, \
          \"Description\":{ \
            \"shape\":\"Description\", \
            \"documentation\":\"<p>A short user-defined function description. AWS Lambda does not use this value. Assign a meaningful description as you see fit.</p>\" \
          }, \
          \"Timeout\":{ \
            \"shape\":\"Timeout\", \
            \"documentation\":\"<p>The function execution time at which AWS Lambda should terminate the function. Because the execution time has cost implications, we recommend you set this value based on your expected execution time. The default is 3 seconds. </p>\" \
          }, \
          \"MemorySize\":{ \
            \"shape\":\"MemorySize\", \
            \"documentation\":\"<p>The amount of memory, in MB, your Lambda function is given. AWS Lambda uses this memory size to infer the amount of CPU allocated to your function. Your function use-case determines your CPU and memory requirements. For example, a database operation might need less memory compared to an image processing function. The default value is 128 MB. The value must be a multiple of 64 MB.</p>\" \
          } \
        } \
      } \
    } \
  } \
   \
  ";
}

@end
