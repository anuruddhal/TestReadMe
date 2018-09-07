import ballerina/config;
import ballerina/http;
import ballerina/io;
import ballerina/log;


endpoint http:Listener helloWorldEP {
    port:80
};


@http:ServiceConfig {
    basePath:"/"
}
service<http:Service> helloWorld bind helloWorldEP {
    @http:ResourceConfig {
        methods:["POST"],
        path:"/"
    }
    getConfig(endpoint outboundEP, http:Request request) {
        http:Response response = new;
        var msg = request.getJsonPayload();
            match msg {
                json jsonPayload => {
                    io:println(jsonPayload);
                }
                error err => {
                    log:printError(err.message, err = err);
                }
            }
        _ = outboundEP->respond(response);            

    }
}
