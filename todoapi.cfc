component rest="true" restPath="/todos"{

    remote any function getToDos() httpMethod="GET" {
        var todos = EntityLoad("todo");

        return QueryToArrayOfStructures(EntityToQuery(todos));
    }

    remote any function addToDo(string description restArgSource="FORM") httpMethod="POST" {

        param name="ARGUMENTS.description" default="";

        var todo = EntityNew("todo");
        todo.setDescription(ARGUMENTS.description);
        todo.setIsDone(0);
        EntitySave(todo);

        return QueryToArrayOfStructures(EntityToQuery(todo))[1];
    }

    remote any function toggleToDoDone(string id restArgSource="PATH") httpMethod="PUT" restPath="/{id}" {

        param name="ARGUMENTS.id" default="0";

        if(ARGUMENTS.id GT 0){
            var todo = EntityLoadByPK("todo", ARGUMENTS.id);
            var isdone = todo.getIsDone() EQ 1 ? 0 : 1;
            todo.setIsDone(isdone);
            EntitySave(todo);
            return QueryToArrayOfStructures(EntityToQuery(todo))[1];
        }else{
            return {id: 0, description: '', isdone: ''};
        }
    }

    remote any function deleteToDo(string id restArgSource="PATH") httpMethod="DELETE" restPath="/{id}" {

        param name="ARGUMENTS.id" default="0";

        if(ARGUMENTS.id GT 0){
            var todo = EntityLoadByPK("todo", ARGUMENTS.id);
            EntityDelete(todo);
        }

        return "";
    }

    private array function QueryToArrayOfStructures(theQuery){
        var theArray = arraynew(1);
        var cols = ListtoArray(theQuery.columnlist);
        var row = 1;
        var thisRow = "";
        var col = 1;
        for(row = 1; row LTE theQuery.recordcount; row = row + 1){
            thisRow = structnew();
            for(col = 1; col LTE arraylen(cols); col = col + 1){
                thisRow[cols[col]] = theQuery[cols[col]][row];
            }
            arrayAppend(theArray,duplicate(thisRow));
        }
        return(theArray);
    }

}