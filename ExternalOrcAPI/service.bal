import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
@display {
    label: "ExternalOrcAPI",
    id: "ExternalOrcAPI-a3ecc278-be8b-4f0a-b6a3-956ebfb3e257"
}
service / on new http:Listener(9090) {

    @display {
        label: "FinanceIntAPI",
        id: "FinanceIntAPI-54f23965-046b-4d96-ae91-8cc7b77c3d60"
    }
    http:Client financeIntApiClient;

    function init() returns error? {
        self.financeIntApiClient = check new ("");
    }

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
