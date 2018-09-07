import ballerina/config;
import ballerina/http;
import ballerina/io;


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
        response.setTextPayload("payload" + "\n");
        _ = outboundEP->respond(response);
    }
}
