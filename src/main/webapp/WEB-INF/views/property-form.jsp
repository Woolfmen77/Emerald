<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<!doctype html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/resources/img/faviconn.png" type="image/x-icon">
    <title>Emerald</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <%@ page import="com.rusanov.emerald.entity.enums.*" %>

    <link rel="stylesheet" href="/resources/css/my_style.css"/>
    <style>
        body {
            background-image: url(https://krot.info/uploads/posts/2020-01/1580225619_13-p-foni-dlya-rieltorskikh-saitov-38.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            display: block;

        }
    </style>


</head>
<body>
<%@include file="blocks/header.jsp" %>
<div class="container-fluid">
    <div class="row">

        <div class="m-auto">
            <main class="col-md-7 m-5 offset-md-4">
                <div class="p-3 my-3">
                    <div class="text-lg-center table-hover  border-info  bg-dark bg-opacity-50">
                        <div class="px-5">

                            <form:form action="/property/addProperty" method="POST" modelAttribute="property"
                                       enctype="multipart/form-data">

                                <form:hidden path="id"/>

                                <table class="table table-bordered table-hover">
                                <tr>
                                <c:forEach items="${property.images}" var="images">

                                    <c:url var="deleteLink" value="/property/deleteImage">
                                        <c:param name="imageId" value="${images.id}"/>
                                        <c:param name="propertyId" value="${property.id}"/>
                                    </c:url>
                                    <c:url var="mainPhoto" value="/property/mainPhoto">
                                        <c:param name="imageId" value="${images.id}"/>
                                        <c:param name="propertyId" value="${property.id}"/>
                                    </c:url>

                                    <tr><img src="/images/${images.id}" height="200px" width="150px"></tr>

                                    <tr>
                                        <a href="${deleteLink}"
                                           onclick="if (!(confirm('<spring:message
                                                   code="table.property.delete.this"/>?'))) return false"
                                           style="color: white"><spring:message code="table.property.delete"/></a> |

                                        <a href="${mainPhoto}"
                                           style="color: white"><spring:message code="property.image.main"/></a></tr>
                                </c:forEach>
                                </tr>
                                <tr>
                                    <td>
                                        <label style="color: white" for="category"><spring:message
                                                code="table.property.category"/></label>
                                    </td>
                                    <td>
                                        <select class="selectpicker form-control" id="category" name="category">
                                            <option disabled selected><spring:message
                                                    code="table.property.select"/></option>
                                            <c:forEach items="<%=CategoryEnum.values()%>" var="category">
                                                <option value="${category}"
                                                        <c:if test='${property.category==category}'>selected</c:if>>
                                                    <c:if test="${category == 'SALL'}"><spring:message
                                                            code="label.sall"/></c:if>
                                                    <c:if test="${category == 'RENTAL'}"><spring:message
                                                            code="label.rental"/></c:if>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label style="color: white" for="propertyType"><spring:message
                                                code="table.property.propertytype"/></label>
                                    </td>
                                    <td>
                                        <select class="selectpicker form-control" id="propertyType" name="propertyType">
                                            <option disabled selected><spring:message
                                                    code="table.property.select"/></option>
                                            <c:forEach items="<%=PropertyTypeEnum.values()%>" var="propertyType">
                                                <option value="${propertyType}"
                                                        <c:if test='${property.propertyType==propertyType}'>selected</c:if>>
                                                    <c:if test="${propertyType == 'COTTAGE'}"><spring:message
                                                            code="table.property.propertytype.cottage"/></c:if>
                                                    <c:if test="${propertyType == 'APARTMENT'}"><spring:message
                                                            code="table.property.propertytype.apartmant"/></c:if>
                                                    <c:if test="${propertyType == 'ROOM'}"><spring:message
                                                            code="table.property.propertytype.room"/></c:if>
                                                </option>
                                            </c:forEach>

                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <label style="color: white" for="apartment"><spring:message
                                                code="table.property.numbeRroom"/></label>
                                    </td>
                                    <td>
                                        <select class="selectpicker form-control" id="apartment" name="apartment">
                                            <option disabled selected><spring:message
                                                    code="table.property.select"/></option>
                                            <c:forEach items="<%=ApartmentEnum.values()%>" var="apartment">
                                                <option value="${apartment}"
                                                        <c:if test='${property.apartment==apartment}'>selected</c:if>>
                                                    <c:if test="${apartment == 'STUDIO'}"><spring:message
                                                            code="table.property.numbeRroom.studio"/></c:if>
                                                    <c:if test="${apartment == 'ONE_ROOM'}"><spring:message
                                                            code="table.property.numbeRroom.one"/></c:if>
                                                    <c:if test="${apartment == 'TWO_ROOM'}"><spring:message
                                                            code="table.property.numbeRroom.two"/></c:if>
                                                    <c:if test="${apartment == 'THREE_ROOM'}"><spring:message
                                                            code="table.property.numbeRroom.three"/></c:if>
                                                    <c:if test="${apartment == 'FOUR_ROOM'}"><spring:message
                                                            code="table.property.numbeRroom.four"/></c:if>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <label style="color: white" for="buildingType"><spring:message
                                                code="table.property.buildingtype"/></label>
                                    </td>
                                    <td>
                                        <select class="selectpicker form-control" id="buildingType" name="buildingType">
                                            <option disabled selected><spring:message
                                                    code="table.property.select"/></option>
                                            <c:forEach items="<%=BuildingTypeEnum.values()%>" var="buildingType">
                                                <option value="${buildingType}"
                                                        <c:if test='${property.buildingType==buildingType}'>selected</c:if>>
                                                    <c:if test="${buildingType == 'BRICK'}"><spring:message
                                                            code="table.property.buildingtype.brick"/></c:if>
                                                    <c:if test="${buildingType == 'BLOCK'}"><spring:message
                                                            code="table.property.buildingtype.block"/></c:if>
                                                    <c:if test="${buildingType == 'PANEL'}"><spring:message
                                                            code="table.property.buildingtype.panel"/></c:if>
                                                    <c:if test="${buildingType == 'MONOLIT'}"><spring:message
                                                            code="table.property.buildingtype.monolit"/></c:if>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label style="color: white" for="repair"><spring:message
                                                code="table.property.repair"/></label>
                                    </td>
                                    <td>
                                        <select class="selectpicker form-control" id="repair" name="repair">
                                            <option disabled selected><spring:message
                                                    code="table.property.select"/></option>
                                            <c:forEach items="<%=RepairEnum.values()%>" var="repair">
                                                <option value="${repair}"
                                                        <c:if test='${property.repair==repair}'>selected</c:if>>
                                                    <c:if test="${repair == 'NO_REPAIR'}"><spring:message
                                                            code="table.property.repair.no"/></c:if>
                                                    <c:if test="${repair == 'COSMETIC'}"><spring:message
                                                            code="table.property.repair.cosmetic"/></c:if>
                                                    <c:if test="${repair == 'CAPITAL'}"><spring:message
                                                            code="table.property.repair.capital"/></c:if>
                                                    <c:if test="${repair == 'EURO'}"><spring:message
                                                            code="table.property.repair.euro"/></c:if>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label style="color: white" for="bathroom"><spring:message
                                                code="table.property.bathroom"/></label>
                                    </td>
                                    <td>
                                        <select class="selectpicker form-control" id="bathroom" name="bathroom">
                                            <option disabled selected><spring:message
                                                    code="table.property.select"/></option>
                                            <c:forEach items="<%=BathroomEnum.values()%>" var="bathroom">
                                                <option value="${bathroom}"
                                                        <c:if test='${property.bathroom==bathroom}'>selected</c:if>>
                                                    <c:if test="${bathroom == 'JOINTLY'}"><spring:message
                                                            code="table.property.bathroom.jointly"/></c:if>
                                                    <c:if test="${bathroom == 'SEPARATE'}"><spring:message
                                                            code="table.property.bathroom.separate"/></c:if>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label style="color: white"><spring:message
                                            code="table.property.price"/></label></td>
                                    <td><form:input type="number" cssClass="form-control" path="price"/></td>
                                </tr>
                                <tr>
                                    <td><label style="color: white"><spring:message
                                            code="table.property.totalArea"/></label></td>
                                    <td><form:input type="number" cssClass="form-control" path="totalArea"/></td>
                                </tr>
                                <tr>
                                    <td><label style="color: white"><spring:message
                                            code="table.property.livingArea"/></label></td>
                                    <td><form:input type="number" cssClass="form-control" path="livingArea"/></td>
                                </tr>
                                <tr>
                                    <td><label style="color: white"><spring:message
                                            code="table.property.description"/></label></td>
                                    <td><form:textarea cssClass="form-control" path="description"/></td>
                                </tr>

                                <tr>
                                    <td><label style="color: white"><spring:message
                                            code="table.property.balcony"/></label></td>
                                    <td><form:checkbox cssStyle=" transform: scale(2); cursor: pointer"
                                                       path="balcony"/></td>
                                </tr>
                                <tr>
                                    <td><label style="color: white"><spring:message
                                            code="table.property.floor"/></label></td>
                                    <td><form:input type="number" cssClass="form-control" path="floor"/></td>
                                </tr>
                                <tr>
                                    <td><label style="color: white"><spring:message
                                            code="table.property.floors"/></label></td>
                                    <td><form:input type="number" cssClass="form-control" path="floors"/></td>
                                </tr>

                                <form:form modelAttribute="propertyAddress">
                                    <tr>
                                        <td style="color: white"><spring:message code="table.property.address"/></td>
                                    </tr>
                                    <tr>
                                        <td><label style="color: white"><spring:message
                                                code="table.property.address.region"/></label></td>
                                        <td><form:input cssClass="form-control" path="region"/></td>
                                    </tr>
                                    <tr>
                                        <td><label style="color: white"><spring:message
                                                code="table.property.address.city"/></label></td>
                                        <td><form:input cssClass="form-control" path="city"/></td>
                                    </tr>
                                    <tr>
                                        <td><label style="color: white"><spring:message
                                                code="table.property.address.district"/></label></td>
                                        <td><form:input cssClass="form-control" path="district"/></td>
                                    </tr>
                                    <tr>
                                        <td><label style="color: white"><spring:message
                                                code="table.property.address.street"/></label></td>
                                        <td><form:input cssClass="form-control" path="street"/></td>
                                    </tr>
                                    <tr>
                                        <td><label style="color: white"><spring:message
                                                code="table.property.address.buildingNumber"/></label></td>
                                        <td><form:input required="!" cssClass="form-control" type="number"
                                                        path="buildingNumber"/></td>
                                    </tr>

                                    <td style="color: white"><spring:message code="table.property.photo"/></td>
                                    <td><input style="color: white" type="file" name="files" multiple/></td>

                                    </table>

                                    <div>
                                        <input style="color: white" type="submit"
                                               value="<spring:message code="table.property.save"/>"
                                               class="add-button btn bg-white bg-opacity-50 btn-outline-secondary"/>


                                        <input type="button" style="color: white"
                                               value="<spring:message code="table.property.back.to.list"/>"
                                               onclick="window.location.href='/property/list'; return false;"
                                               class="add-button btn m-5 bg-white bg-opacity-50 btn-outline-secondary"/>
                                    </div>
                                </form:form>
                            </form:form>
                            <div style="clear:both"></div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
</div>

<%@include file="blocks/footer.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>
