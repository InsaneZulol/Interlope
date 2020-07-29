function Component() {

}

Component.prototype.createOperations = function() {

    try {
        var reg_add = ["reg", "add", "HKCU\\Software\\Google\\Chrome\\NativeMessagingHosts\\io.alan_kaluza.interlope",
        "/ve", "/t", "REG_SZ", "/d", "@TargetDir@\\native_messaging_manifest.json", "/f"];
        var reg_del = ["reg", "delete", "HKCU\\Software\\Google\\Chrome\\NativeMessagingHosts\\io.alan_kaluza.interlope", "/f"];

        // call the base create operations function
        component.createOperations();
        if (installer.value("os") === "win") {
        component.addOperation("Execute", reg_add, "UNDOEXECUTE", reg_del);
        }
    } catch (e) {
        print(e);
    }
}


