<%@ page import="
        com.scooterframework.web.util.F,
        com.scooterframework.web.util.O,
        com.scooterframework.web.util.W"
%>

<h2>Edit pet</h2>
<%=W.errorMessage("pet")%>

<b>Owner:</b> <%=O.hv("pet.owner.first_name")%> <%=O.hv("pet.owner.last_name")%>
<br/>

<%=F.formForOpen("pets", "pet")%>
  <p>
    <%=F.label("name")%><br />
    <input type="text" id="pet_name" name="name" value="<%=O.hv("pet.name")%>" size="30" />
  </p>
  <p>
    <%=F.label("birth_date")%><br />
    <input type="text" id="pet_birth_date" name="birth_date" value="<%=O.value("pet.birth_date", "yyyy-MM-dd")%>" size="10" /> (yyyy-mm-dd)
  </p>
  <p>
    <%=F.label("type_id")%><br />
    <%=W.displayHtmlSelect("type_id", "types", "id:type;optionId:id;optionValue:name;selectedId:" + O.hv("pet.type_id")) %>
  </p>
  <input id="pet_submit" name="commit" type="submit" value="Update Pet" />&nbsp;&nbsp;&nbsp;<input type="reset"/>
<%=F.formForClose("pets")%>