# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**planRouteRoutePost**](DefaultApi.md#planrouteroutepost) | **POST** /route | Plan Route


# **planRouteRoutePost**
> TourResponse planRouteRoutePost(tourRequest)

Plan Route

### Example
```dart
import 'package:openapi/api.dart';

final api_instance = DefaultApi();
final tourRequest = TourRequest(); // TourRequest | 

try {
    final result = api_instance.planRouteRoutePost(tourRequest);
    print(result);
} catch (e) {
    print('Exception when calling DefaultApi->planRouteRoutePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tourRequest** | [**TourRequest**](TourRequest.md)|  | 

### Return type

[**TourResponse**](TourResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

