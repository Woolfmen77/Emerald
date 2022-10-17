<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.rusanov.emerald.entity.enums.*" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title><spring:message code="table.property.title"/></title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/resources/img/faviconn.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <link rel="stylesheet" href="/resources/css/stylelog.css"/>
    <%--        <link rel="stylesheet" href="/resources/css/my_style.css"/>--%>
    <style>
        body {
            background-image: url(https://kartinkin.net/uploads/posts/2021-07/1626279149_21-kartinkin-com-p-nedvizhimost-fon-krasivo-31.jpg);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            display: block;
        }

        table {
            font-size: 14px;
            font-optical-sizing: auto;
            width: 50px;
        }
        a{
            color: #FFFFFF;
        }

        th {
            font-weight: normal;
            font-style: oblique;
            letter-spacing: 2px;
            text-transform: uppercase;
            writing-mode: vertical-rl;
            transform: scale(-1);
        }
        tr:hover td {
            text-decoration: underline;
        }
    </style>
</head>

<body>
<jsp:include page="blocks/header.jsp"/>
<br>

<div>
    <div>
        <br>
        <div class="text-center bg-black my-2 bg-opacity-50 ">
            <h2 style="color: white"><spring:message code="table.property.title.page"/></h2>
        </div>
    </div>
    <main>
        <div class="p-5  my-1">
            <div>
                <div class=" p-5 d-block">
                    <div class="container">
                        <div class="col-md-6 m-5 offset-md-10">
                            <div class="form-horizontal text-center">
                                <form method="post" action="/filter/propertyFilter/">
                                    <%--                            <label>--%>
                                    <%--                                <input class="bg-white  btn" type="text" name="propertyFilter" placeholder="<spring:message code="label.search"/>"--%>
                                    <%--                                       value="${propertyFilter}"/>--%>
                                    <%--                            </label>--%>
                                    <label for="category"></label><select style="color: white"
                                                                          class="selectpicker add-button  btn bg-black bg-opacity-50 btn-outline-secondary"
                                                                          id="category"
                                                                          name="category">
                                    <option style="color: white" disabled selected><spring:message
                                            code="table.property.select"/></option>
                                    <option value="<%=CategoryEnum.SALL%>"><spring:message code="label.sall"/></option>
                                    <option value="<%=CategoryEnum.RENTAL%>"><spring:message
                                            code="label.rental"/></option>
                                </select>
                                        <c:if test="${theProperty.category == 'SALL'}"><spring:message
                                                code="label.sall"/></c:if>
                                    <input class="add-button btn bg-black bg-opacity-50 btn-outline-secondary"
<%--                                            <c:if test="${c!=1}"> disabled </c:if>--%>
                                           type="submit" style="color: white"
                                           value="<spring:message code="label.search"/>"/>
                                    <input class="add-button btn bg-black bg-opacity-50 btn-outline-secondary"
                                           type="button" style="color: white"
                                           value="<spring:message code="label.clean"/>"
                                           onclick="cleFilter()"/>


                                    <input type="button" style="color: white"
                                           value="<spring:message code="table.property.add.property"/>"
                                           onclick="window.location.href='showPropertyForm'; return false;"
                                           class="add-button btn bg-black bg-opacity-50 btn-outline-secondary"/>

                                </form>
                            </div>
                        </div>
                    </div>

                    <table class="table table-bordered table-hover  px-5 border-info  bg-dark bg-opacity-50"
                           style="color: white">
                        <th style="color: white"><spring:message code="table.property.index"/></th>
                        <th style="color: white"><spring:message code="table.property.id"/></th>
                        <th style="color: white"><spring:message code="table.property.category"/></th>
                        <th style="color: white"><spring:message code="table.property.propertytype"/></th>
                        <th style="color: white"><spring:message code="table.property.numbeRroom"/></th>
                        <th style="color: white"><spring:message code="table.property.buildingtype"/></th>
                        <th style="color: white"><spring:message code="table.property.repair"/></th>
                        <th style="color: white"><spring:message code="table.property.bathroom"/></th>
                        <th style="color: white"><spring:message code="table.property.price"/></th>
                        <th style="color: white"><spring:message code="table.property.totalArea"/></th>
                        <th style="color: white"><spring:message code="table.property.livingArea"/></th>
                        <th style="color: white"><spring:message code="table.property.description"/></th>
                        <th style="color: white"><spring:message code="table.property.balcony"/></th>
                        <th style="color: white"><spring:message code="table.property.floor"/></th>
                        <th style="color: white"><spring:message code="table.property.floors"/></th>
                        <th style="color: white"><spring:message code="table.property.address"/></th>
                        <th style="color: white"><spring:message code="table.property.action"/></th>


                        <c:forEach items="${properties}" var="theProperty" varStatus="theCount">

                            <tr>
                                <a href="/property/info/${theProperty.id}">
                                    <td style="color: white">  <a href="/property/info/${theProperty.id}">${theCount.count}</a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">${theProperty.id} </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">
                                            <c:if test="${theProperty.category == 'SALL'}"><spring:message
                                                    code="label.sall"/></c:if>
                                            <c:if test="${theProperty.category == 'RENTAL'}"><spring:message
                                                    code="label.rental"/></c:if>
                                </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">
                                            <c:if test="${theProperty.propertyType == 'COTTAGE'}"><spring:message code="table.property.propertytype.cottage"/></c:if>
                                            <c:if test="${theProperty.propertyType == 'APARTMENT'}"><spring:message code="table.property.propertytype.apartmant"/></c:if>
                                            <c:if test="${theProperty.propertyType == 'ROOM'}"><spring:message code="table.property.propertytype.room"/></c:if>
                                </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">
                                            <c:if test="${theProperty.apartment == 'STUDIO'}"><spring:message code="table.property.numbeRroom.studio"/></c:if>
                                            <c:if test="${theProperty.apartment == 'ONE_ROOM'}"><spring:message code="table.property.numbeRroom.one"/></c:if>
                                            <c:if test="${theProperty.apartment == 'TWO_ROOM'}"><spring:message code="table.property.numbeRroom.two"/></c:if>
                                            <c:if test="${theProperty.apartment == 'THREE_ROOM'}"><spring:message code="table.property.numbeRroom.three"/></c:if>
                                            <c:if test="${theProperty.apartment == 'FOUR_ROOM'}"><spring:message code="table.property.numbeRroom.four"/></c:if>
                                </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">
                                            <c:if test="${theProperty.buildingType == 'BRICK'}"><spring:message code="table.property.buildingtype.brick"/></c:if>
                                            <c:if test="${theProperty.buildingType == 'BLOCK'}"><spring:message code="table.property.buildingtype.block"/></c:if>
                                            <c:if test="${theProperty.buildingType == 'PANEL'}"><spring:message code="table.property.buildingtype.panel"/></c:if>
                                            <c:if test="${theProperty.buildingType == 'MONOLIT'}"><spring:message code="table.property.buildingtype.monolit"/></c:if>
                                </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">
                                            <c:if test="${theProperty.repair == 'NO_REPAIR'}"><spring:message code="table.property.repair.no"/></c:if>
                                            <c:if test="${theProperty.repair == 'COSMETIC'}"><spring:message code="table.property.repair.cosmetic"/></c:if>
                                            <c:if test="${theProperty.repair == 'CAPITAL'}"><spring:message code="table.property.repair.capital"/></c:if>
                                            <c:if test="${theProperty.repair == 'EURO'}"><spring:message code="table.property.repair.euro"/></c:if>
                                </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">
                                            <c:if test="${theProperty.bathroom == 'JOINTLY'}"><spring:message code="table.property.bathroom.jointly"/></c:if>
                                            <c:if test="${theProperty.bathroom == 'SEPARATE'}"><spring:message code="table.property.bathroom.separate"/></c:if>
                                </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">${theProperty.price} </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">${theProperty.totalArea} </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">${theProperty.livingArea} </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">${theProperty.description} </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}"><c:if test="${theProperty.balcony == true}">
                                    yes</c:if>
                                    <c:if test="${theProperty.balcony == false}">
                                        no</c:if> </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">${theProperty.floor} </a></td>
                                <td style="color: white"><a href="/property/info/${theProperty.id}">${theProperty.floors} </a></td>

                                <td style="color: white"><a href="/property/info/${theProperty.id}">
                                        ${theProperty.address.region}
                                        ${theProperty.address.city}
                                        ${theProperty.address.district}
                                        ${theProperty.address.street}
                                        ${theProperty.address.buildingNumber}
                                </a>
                                </td>
                                    <%--                                    <c:url var="deleteLink" value="/property/delete">--%>
                                    <%--                                        <c:param name="propertyId" value="${theProperty.id}"/>--%>
                                        <%--                                    </c:url>--%>
                                <td style="color: white"><a style="color: white"
                                                            href="/property/editPropertyForm/${theProperty.id}"><spring:message
                                        code="table.property.edit"/></a> |
                                    <a style="color: white" href="/property/delete/${theProperty.id}"
                                       onclick="if (!(confirm('<spring:message
                                               code="table.property.delete.this"/>?'))) return false"
                                    ><spring:message code="table.property.delete"/></a></td>
                            </tr>


                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </main>
</div>


<div class="footer">
    <%@include file="blocks/footer.jsp" %>
</div>

<script type="text/javascript">
    function cleFilter() {
        window.location = '/property/list';
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>