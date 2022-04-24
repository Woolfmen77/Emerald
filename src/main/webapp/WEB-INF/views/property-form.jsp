<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Property Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stylelog.css"/>
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/add-customer-style.css"/>--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <%@ page import="com.rusanov.emerald.entity.enums.*" %>

</head>

<body>
<div id="wrapper">
    <div id="header">
        <h2>Add property</h2>
    </div>
</div>

<br>
<br>


<div id="container">

    <%--@elvariable id="user" type="java"--%>
    <form:form action="addProperty" method="POST" modelAttribute="property">

        <!-- need to associate this data with property id -->
        <form:hidden path="id"/>

        <table class="table table-bordered table-hover">
            <tr>
                <td>
                    <label for="apartment">Apartment</label>
                </td>
                <td>
                    <select class="selectpicker" id="apartment" name="apartment">
                        <c:forEach items="<%=ApartmentEnum.values()%>" var="apartment">
                            <option value="${apartment}">${apartment}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="buildingType">Building type</label>
                </td>
                <td>
                    <select class="selectpicker" id="buildingType" name="buildingType">
                        <c:forEach items="<%=BuildingTypeEnum.values()%>" var="buildingType">
                            <option value="${buildingType}">${buildingType}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="propertyType">Property type</label>
                </td>
                <td>
                    <select class="selectpicker" id="propertyType" name="propertyType">
                        <c:forEach items="<%=PropertyTypeEnum.values()%>" var="propertyType">
                            <option value="${propertyType}">${propertyType}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="repair">Repair</label>
                </td>
                <td>
                    <select class="selectpicker" id="repair" name="repair">
                        <c:forEach items="<%=RepairEnum.values()%>" var="repair">
                            <option value="${repair}">${repair}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="category">Category</label>
                </td>
                <td>
                    <select class="selectpicker" id="category" name="category">
                        <c:forEach items="<%=CategoryEnum.values()%>" var="category">
                            <option value="${category}">${category}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="bathroom">Bathroom</label>
                </td>
                <td>
                    <select class="selectpicker" id="bathroom" name="bathroom">
                        <c:forEach items="<%=BathroomEnum.values()%>" var="bathroom">
                            <option value="${bathroom}">${bathroom}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label>NumberRoom:</label></td>
                <td><form:input type="number" path="numberRoom"/></td>
            </tr>
            <tr>
                <td><label>Price:</label></td>
                <td><form:input type="number" path="price"/></td>
            </tr>
            <tr>
                <td><label>TotalArea:</label></td>
                <td><form:input type="number" path="totalArea"/></td>
            </tr>
            <tr>
                <td><label>LivingArea:</label></td>
                <td><form:input type="number" path="livingArea"/></td>
            </tr>
            <tr>
                <td><label>Description:</label></td>
                <td><form:textarea path="description"/></td>
            </tr>

            <tr>
                <td><label>Balcony:</label></td>
                <td><form:checkbox path="balcony"/></td>
            </tr>
            <tr>
                <td><label>Floor:</label></td>
                <td><form:input type="number" path="floor"/></td>
            </tr>
            <tr>
                <td><label>Floors:</label></td>
                <td><form:input type="number" path="floors"/></td>
            </tr>
            <tr>
                <td><label></label></td>
                <td><input type="submit" value="Save" class="save"/></td>
            </tr>
        </table>
    </form:form>

    <div style="clear:both"></div>

    <br>
    <br>
    <br>

    <p>
    <div>
        <input type="button" value="Back to List"
               onclick="window.location.href='/property-list.jsp'; return false;"
               class="add-button btn btn-outline-secondary"/>
    </div>
    </p>
</div>

</body>
</html>