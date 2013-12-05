component {
    this.datasource = "todoapi";
    this.ormenabled = true;

    boolean function onRequestStart(targetPage){
        if (StructKeyExists(url, "ormreload")){
            ORMReload();
        }
        return true;
    }
}