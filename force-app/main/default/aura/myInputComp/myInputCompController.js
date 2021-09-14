({
	transforString : function(component, event, helper) {
		var inputText = component.get("v.myText");
        
        // Create the action
        var action = component.get("c.returnTransformedText");
        action.setParams({ "myText" : inputText });
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //component.set("v.expenses", response.getReturnValue());
                alert(response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        
        // Send action off to be executed
        $A.enqueueAction(action);
	}
})