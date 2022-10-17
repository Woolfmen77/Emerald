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

    <style>
        body {
            background-image: url(https://krot.info/uploads/posts/2020-01/1580225657_14-p-foni-dlya-rieltorskikh-saitov-39.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            display: block;
        }

        tr:hover th {
            text-decoration: underline;
            text-align: center;
        }

        .my-carousel {
            margin: 0;
            padding: 80px;
            max-width: 1250px;
            max-height: 650px;
        }

        .my-carousel .carousel-inner {
            object-fit: cover;
            width: 1150px;
            height: 650px;
        }

        .my-carousel .carousel-item {
            position: absolute;
        }

        .my-carousel .carousel-item img {
            position: center;
            object-fit: scale-down;
            width: 1090px;
            height: 650px;
        }
    </style>

</head>
<body>

<%@include file="blocks/header.jsp" %>


<div class="container-fluid">
    <div class="row">
        <main class="col-lg-12 px-md-4">
            <div class="container-fluid my-carousel  ">
                <div id="carouselExampleCaptions" class="carousel slide carousel-fade bg-black bg-opacity-50"
                     data-bs-ride="carousel"
                     data-bs-interval="3000">
                    <div class="carousel-indicators bg-black bg-opacity-50">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
                                class="active"
                                aria-current="true" aria-label="Slide 1"></button>
                        <c:forEach items="${image}" varStatus="status">
                            <button type="button" data-bs-target="#carouselExampleCaptions"
                                    data-bs-slide-to="${status.count}"
                                    aria-label="Slide ${status.count + 1}"></button>
                        </c:forEach>
                    </div>
                    <div class="carousel-inner">

                        <div class="carousel-item  active">
                            <img src="/images/${info.previewImageId}" class="img">
                        </div>

                        <c:forEach items="${image}" var="images">
                            <div class="carousel-item ">
                                <img src="/images/${images.id}" class="img ">
                            </div>
                        </c:forEach>

                    </div>
                    <button class="carousel-control-prev bg-black bg-opacity-50" type="button"
                            data-bs-target="#carouselExampleCaptions"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next bg-black bg-opacity-50" type="button"
                            data-bs-target="#carouselExampleCaptions"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </main>
    </div>
</div>

<div class="container  col-sm-7 col-sm py-0 d-flex   text-center text-start p-5">
    <div class=" p-4 my-5 px-5 d-flex ">
        <div class="row px-5 p-5 d-flex ">
            <table style="color: #FFFFFF; --bs-table-hover-color: blye"
                   class=" table table-hover col-sm-8 col-sm offset-0  p-3  border-info  bg-dark bg-opacity-50">
                <tr>
                    <select class="selectpicker text-center h5   mb-0 table-hover  bg-black bg-opacity-50">
                        <option selected style="color: black"><spring:message
                                code="table.property.data.contacts.specialist"/>:
                        </option>
                        <option disabled style="color: white">${info.user.name}</option>
                        <option disabled style="color: white">${info.user.email}</option>
                        <option disabled style="color: white">${info.user.phone}</option>
                    </select>
                </tr>
                <tr>
                    <select class="selectpicker text-center  h5  mb-0  table-hover  bg-dark bg-opacity-50">
                        <option selected style="color: black"><spring:message code="table.property.data.adress"/>:
                        </option>
                        <option disabled style="color: white">
                            <spring:message code="table.property.address.region"/> : ${info.address.region}</option>
                        <option disabled style="color: white">
                            <spring:message code="table.property.address.city"/> : ${info.address.city}</option>
                        <option disabled style="color: white">
                            <spring:message code="table.property.address.district"/> : ${info.address.district}</option>
                        <option disabled style="color: white">
                            <spring:message code="table.property.address.street"/> : ${info.address.street}</option>
                        <option disabled style="color: white">
                            <spring:message code="table.property.address.buildingNumber"/>
                            : ${info.address.buildingNumber}</option>
                    </select>
                </tr>

                <tr class="text-center">
                    <th colspan="4"><h4><spring:message code="table.property.description"/>:</h4></th>

                </tr>
                <tr class="text-center">
                    <th colspan="4">${info.description}</th>
                </tr>


                <tr class="text-center">
                    <th colspan="4"><h4><spring:message code="table.property.data"/>:</h4></th>
                </tr>

                <tr>
                    <th><spring:message code="table.property.category"/>:</th>
                    <th>
                        <c:if test="${info.category == 'SALL'}"><spring:message
                                code="label.sall"/></c:if>
                        <c:if test="${info.category == 'RENTAL'}"><spring:message
                                code="label.rental"/></c:if>
                    </th>
                    <th><spring:message code="table.property.price"/>:</th>
                    <th>${info.price}</th>

                </tr>
                <tr>
                    <th><spring:message code="table.property.propertytype"/>:</th>
                    <th>
                        <c:if test="${info.propertyType == 'COTTAGE'}"><spring:message
                                code="table.property.propertytype.cottage"/></c:if>
                        <c:if test="${info.propertyType == 'APARTMENT'}"><spring:message
                                code="table.property.propertytype.apartmant"/></c:if>
                        <c:if test="${info.propertyType == 'ROOM'}"><spring:message
                                code="table.property.propertytype.room"/></c:if>
                    </th>
                    <th><spring:message code="table.property.totalArea"/>:</th>
                    <th>${info.totalArea}</th>
                </tr>
                <tr>
                    <th><spring:message code="table.property.numbeRroom"/>:</th>
                    <th>
                        <c:if test="${info.apartment == 'STUDIO'}"><spring:message
                                code="table.property.numbeRroom.studio"/></c:if>
                        <c:if test="${info.apartment == 'ONE_ROOM'}"><spring:message
                                code="table.property.numbeRroom.one"/></c:if>
                        <c:if test="${info.apartment == 'TWO_ROOM'}"><spring:message
                                code="table.property.numbeRroom.two"/></c:if>
                        <c:if test="${info.apartment == 'THREE_ROOM'}"><spring:message
                                code="table.property.numbeRroom.three"/></c:if>
                        <c:if test="${info.apartment == 'FOUR_ROOM'}"><spring:message
                                code="table.property.numbeRroom.four"/></c:if>
                    </th>
                    <th><spring:message code="table.property.livingArea"/>:</th>
                    <th>${info.livingArea}</th>
                </tr>
                <tr>
                    <th><spring:message code="table.property.buildingtype"/>:</th>
                    <th>
                        <c:if test="${info.buildingType == 'BRICK'}"><spring:message
                                code="table.property.buildingtype.brick"/></c:if>
                        <c:if test="${info.buildingType == 'BLOCK'}"><spring:message
                                code="table.property.buildingtype.block"/></c:if>
                        <c:if test="${info.buildingType == 'PANEL'}"><spring:message
                                code="table.property.buildingtype.panel"/></c:if>
                        <c:if test="${info.buildingType == 'MONOLIT'}"><spring:message
                                code="table.property.buildingtype.monolit"/></c:if>
                    </th>
                    <th><spring:message code="table.property.balcony"/>:</th>
                    <th><c:if test="${info.balcony == true}">
                        yes</c:if>
                        <c:if test="${info.balcony == false}">
                            no</c:if></th>
                </tr>
                <tr>
                    <th><spring:message code="table.property.repair"/>:</th>
                    <th>
                        <c:if test="${info.repair == 'NO_REPAIR'}"><spring:message
                                code="table.property.repair.no"/></c:if>
                        <c:if test="${info.repair == 'COSMETIC'}"><spring:message
                                code="table.property.repair.cosmetic"/></c:if>
                        <c:if test="${info.repair == 'CAPITAL'}"><spring:message code="table.property.repair.capital"/></c:if>
                        <c:if test="${info.repair == 'EURO'}"><spring:message code="table.property.repair.euro"/></c:if>
                    </th>
                    <th><spring:message code="table.property.floor"/>:</th>
                    <th>${info.floor}</th>
                </tr>
                <tr>
                    <th><spring:message code="table.property.bathroom"/>:</th>
                    <th>
                        <c:if test="${info.bathroom == 'JOINTLY'}"><spring:message
                                code="table.property.bathroom.jointly"/></c:if>
                        <c:if test="${info.bathroom == 'SEPARATE'}"><spring:message
                                code="table.property.bathroom.separate"/></c:if>
                    </th>
                    <th><spring:message code="table.property.floors"/>:</th>
                    <th>${info.floors}</th>
                </tr>
                <tr>
                    <th><spring:message code="label.date.added"/>:</th>
                    <th>${info.dateAdded}</th>
                    <th><spring:message code="label.date.modified"/>:</th>
                    <th>${info.modificationDate}</th>
                </tr>
            </table>
        </div>
    </div>
</div>


<br>
<br>
<br>


<h6 class="sidebar-heading d-flex border-bottom table-hover  justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
    <h6 class="w-100">
        <a class="link-secondary  text-black" href="#" aria-label="Add a new report">
            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="75" fill="currentColor"
                 class="bi w-100 bg-black bg-opacity-50 bi-arrow-up-square" viewBox="0 0 16 16">
            </svg>
        </a>
    </h6>
</h6>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>


<%@include file="blocks/footer.jsp" %>


</body>
</html>
