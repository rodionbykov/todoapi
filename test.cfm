<cfset ormReload() />

<h2>Array of ToDo objects</h2>

<cfset todos = entityload("todo") />
<cfdump var="#EntityToQuery(todos)#" />

<h2>Array of ToDos from REST</h2>

<cfhttp url="http://localhost:8000/rest/todoapi/todos" method="GET">
</cfhttp>

<cfset arrTasks = deserializeJSON(cfhttp.filecontent) />

<cfdump var="#arrTasks#" />

<!---

<h2>New ToDo from CFML</h2>

<cfset todo = EntityNew("todo") />
<cfset todo.setDescription("sdjhsdkjfhsdkjfdsjfkj") />
<cfset todo.setIsDone(0) />
<cfset EntitySave(todo) />

<cfdump var="#todo#" />

<h2>New ToDo from REST</h2>

<cfhttp url="http://localhost:8000/rest/todoapi/todos" method="POST">
    <cfhttpparam name="description" type="formfield" value="sdkjfsklfjksldfjklsdjfklsdf" />
</cfhttp>

<cfset structTask = deserializeJSON(cfhttp.filecontent) />

<cfdump var="#structTask#" />

--->

<!---

<h2>Toggle ToDo from CFML</h2>

<cfset todo = entityLoadByPK("todo", 2) />
<cfset isdone = todo.getIsDone() EQ 1 ? 0 : 1 />
<cfset todo.setIsDone(isdone) />
<cfset EntitySave(todo) />

<cfdump var="#todo#" />

--->

<!---

<h2>Toggle ToDo from REST</h2>

<cfhttp url="http://localhost:8000/rest/todoapi/todos/2" method="PUT"></cfhttp>

<cfset structTask = deserializeJSON(cfhttp.filecontent) />

<cfdump var="#structTask#" />

--->

<!---

<h2>Delete ToDo from REST</h2>

<cfhttp url="http://localhost:8000/rest/todoapi/todos/11" method="DELETE"></cfhttp>

<cfset structTask = deserializeJSON(cfhttp.filecontent) />

<cfdump var="#structTask#" />         \

--->