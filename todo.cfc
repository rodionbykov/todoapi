component persistent="true" table="todos" {
  property name="id" column="id" fieldtype="id" generator="native";
  property name="description" column="description";
  property name="isdone" column="isdone";
}