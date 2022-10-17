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

    <link rel="stylesheet" href="/resources/css/my_style.css"/>

    <style>
        body {
            background-image: url(https://kartinkin.net/uploads/posts/2021-07/1627176417_4-kartinkin-com-p-fon-dlya-vizitki-nedvizhimost-krasivo-4.jpg);
            background-repeat: no-repeat;
            background-position: left;
            background-size: cover;
            display: block;
        }

        .product:hover {
            transition: 0.9s;
            transform: scale(0.92);
        }

        .product-link {
            color: #000 !important;
            text-decoration: none
        }
    </style>

</head>
<body>

<%@include file="blocks/header.jsp" %>
<div class="container-fluid">
    <div class="row">
        <div class="container-fluid my-carousel  ">

            <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="carousel"
                 data-bs-interval="5000">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                            aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/resources/img/dom.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block col">
                            <h4 class="bg-dark bg-opacity-50"><spring:message code="label.carusel.house"/></h4>
                            <h5 class="bg-dark bg-opacity-50"><spring:message code="label.carusel.house.info"/></h5>
                            <a class="btn btn-lg btn-primary" href="/filter/house"><span
                                    style="vertical-align: inherit;">
                        <span style="vertical-align: inherit;"><spring:message code="label.carusel.more"/></span></span></a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="/resources/img/kvartira.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block col">
                            <h4 class="bg-dark bg-opacity-50"><spring:message code="label.carusel.partment"/></h4>
                            <h5 class="bg-dark bg-opacity-50"><spring:message code="label.carusel.partment.info"/></h5>
                            <a class="btn btn-lg btn-primary" href="/filter/apartment"><span
                                    style="vertical-align: inherit;">
                        <span style="vertical-align: inherit;"><spring:message code="label.carusel.more"/></span></span></a>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="/resources/img/komnata.jpg" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block col">
                            <h4 class="bg-dark bg-opacity-50"><spring:message code="label.carusel.room"/></h4>
                            <h5 class="bg-dark bg-opacity-50"><spring:message code="label.carusel.room.info"/></h5>
                            <a class="btn btn-lg btn-primary" href="/filter/room"><span
                                    style="vertical-align: inherit;">
                        <span style="vertical-align: inherit;"><spring:message code="label.carusel.more"/></span></span></a>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>

        </div>
        <nav id="sidebarMenu" class="m-100 col-lg-3 d-md-block  sidebar collapse ">
            <div class="position-sticky pt-3 ">
                <div>
                    <h2><spring:message code="label.view.sort"/>:</h2>
                </div>
                <div>
                    <form method="post" action="/filter/addressFilter">
                        <label class="w-100 my-1 mb-1 p-1  px-5 ">
                            <input class="bg-white  btn" type="text" name="addressFilter"
                                   placeholder="<spring:message code="label.view.sort.address"/>"
                                   value="${addressFilter}"/>
                        </label>
                        <input class="add-button btn my-1 w-100 mb-1 bg-primary p-1  px-3 btn-outline-secondary"
                               type="submit"
                               style="color: white"
                               value="<spring:message code="label.search"/>"/>
                        <input class="add-button btn bg-primary w-100 my-1 mb-1 p-1 px-4 btn-outline-secondary"
                               type="button"
                               style="color: white"
                               value="<spring:message code="label.clean"/>"
                               onclick="clearFilter()"/>
                    </form>
                </div>

                <div>
                    <a class="btn btn-lg m-1 w-100 btn-primary" style="border:5px solid rgba(63,29,187,0.69)"
                       href="/property/categorySall"><span
                            style="vertical-align: inherit;">
                        <span style="vertical-align: center;"><spring:message code="label.sall"/></span></span></a>
                </div>
                <div>
                    <a class="btn btn-lg m-1 w-100 btn-primary" style="border:5px solid rgba(63,29,187,0.69)"
                       href="/property/categoryRental"><span
                            style="vertical-align: inherit;">
                        <span style="vertical-align: center;"><spring:message code="label.rental"/></span></span></a>
                </div>
                <div>
                    <select class="selectpicker btn btn-lg m-1 w-100 btn-primary form-control"
                            onchange="window.location=this.options[this.selectedIndex].value" name="price">
                        <option disabled selected><spring:message code="table.property.price"/> <spring:message
                                code="table.property.select"/></option>
                        <option value="/filter/priceAscending"><spring:message
                                code="label.view.sort.price.ascending"/></option>
                        <option value="/filter/priceDescending"><spring:message
                                code="label.view.sort.price.descending"/></option>
                    </select>
                </div>
                <div>
                    <select class="selectpicker btn btn-lg m-1 w-100 btn-primary form-control"
                            onchange="window.location=this.options[this.selectedIndex].value" name="apartment">
                        <option disabled selected><spring:message code="table.property.numbeRroom"/></option>
                        <option value="/filter/apartmentStudio"><spring:message
                                code="table.property.numbeRroom.studio"/></option>
                        <option value="/filter/apartmentOneRoom"><spring:message
                                code="table.property.numbeRroom.one"/></option>
                        <option value="/filter/apartmentTwoRoom"><spring:message
                                code="table.property.numbeRroom.two"/></option>
                        <option value="/filter/apartmentThreeRoom"><spring:message
                                code="table.property.numbeRroom.three"/></option>
                        <option value="/filter/apartmentFourRoom"><spring:message
                                code="table.property.numbeRroom.four"/></option>
                    </select>
                </div>

            </div>
        </nav>
        <main class="col-md-7 ms-sm-auto col-lg-9 px-md-4">
            <div class="album  py-5 ">
                <div class="containe ">
                    <div class="row card-columns  row-cols-1 row-cols-sm-2 row-cols-md-3 bo g-3">
                        <c:forEach items="${properties}" var="product">

                            <div style="border:2px solid rgba(29,79,187,0.78)"
                                 class="col card py-3 px-3 product bg-white bg-opacity-25 ">
                                <a href="/property/info/${product.id}">
                                    <div class="product-link ">

                                        <img src="/images/${product.previewImageId} "
                                             class="img-thumbnail product   rounded d-block"
                                             height="150">
                                        <div class="card-body text-center ">
                                            <div class="card-text text-center ">
                                                <h4 style="color: #000209">
                                                    <c:if test="${product.category == 'SALL'}"><spring:message
                                                            code="label.sall"/></c:if>
                                                    <c:if test="${product.category == 'RENTAL'}"><spring:message
                                                            code="label.rental"/></c:if>
                                                </h4></div>
                                            <div class="card-text ">
                                                <h5 style="color: #000209"><spring:message
                                                        code="table.property.price"/>: ${product.price}</h5></div>
                                            <div class="card-text ">
                                                <h6 style="color: #000209"><spring:message
                                                        code="table.property.propertytype"/>:
                                                    <c:if test="${product.propertyType == 'COTTAGE'}"><spring:message
                                                            code="table.property.propertytype.cottage"/></c:if>
                                                    <c:if test="${product.propertyType == 'APARTMENT'}"><spring:message
                                                            code="table.property.propertytype.apartmant"/></c:if>
                                                    <c:if test="${product.propertyType == 'ROOM'}"><spring:message
                                                            code="table.property.propertytype.room"/></c:if>
                                                </h6>
                                            </div>
                                            <div class="card-text ">
                                                <h6 style="color: #000209"><spring:message
                                                        code="table.property.numbeRroom"/>:
                                                    <c:if test="${product.apartment == 'STUDIO'}"><spring:message
                                                            code="table.property.numbeRroom.studio"/></c:if>
                                                    <c:if test="${product.apartment == 'ONE_ROOM'}"><spring:message
                                                            code="table.property.numbeRroom.one"/></c:if>
                                                    <c:if test="${product.apartment == 'TWO_ROOM'}"><spring:message
                                                            code="table.property.numbeRroom.two"/></c:if>
                                                    <c:if test="${product.apartment == 'THREE_ROOM'}"><spring:message
                                                            code="table.property.numbeRroom.three"/></c:if>
                                                    <c:if test="${product.apartment == 'FOUR_ROOM'}"><spring:message
                                                            code="table.property.numbeRroom.four"/></c:if>
                                                </h6>
                                            </div>
                                            <div class="card-text ">
                                                <h6 style="color: #000209"><spring:message
                                                        code="table.property.address.city"/>: ${product.address.city}</h6>
                                            </div>
                                            <div class="card-text ">
                                                <h6 style="color: #000209"><spring:message
                                                        code="table.property.address.street"/>: ${product.address.street}</h6>
                                            </div>
                                            <div class="card-text ">
                                                <h7 style="color: #000209"><spring:message
                                                        code="label.date.added"/>: ${product.dateAdded}</h7>
                                            </div>
                                            <div class="card-text ">
                                                <h7 style="color: #000209"><spring:message
                                                        code="label.date.modified"/>: ${product.modificationDate}</h7>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="btn-group bg-primary bg-opacity-75 w-100">
                                                    <a href="/property/info/${product.id}" type="submit"
                                                       class="btn btn-sm btn-outline-secondary"
                                                       style="border:2px solid rgba(29,79,187,0.78); color: #FFFFFF">
                                                        <spring:message code="label.carusel.more"/>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </a>
                            </div>

                        </c:forEach>

                    </div>
                </div>
            </div>
        </main>
    </div>
</div>


<h6 class="sidebar-heading d-flex border-bottom table-hover  justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
    <h6 class="w-100">
        <a class="link-secondary  text-black" href="#" aria-label="Add a new report">
            <svg xmlns="http://www.w3.org/2000/svg" width="100" height="75" fill="currentColor"
                 class="bi w-100 bg-black bg-opacity-50 bi-arrow-up-square" viewBox="0 0 16 16">
            </svg>
        </a>
    </h6>
</h6>


<script type="text/javascript">
    function clearFilter() {
        window.location = '/';
    }
</script>


<%@include file="blocks/footer.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>


</body>
</html>
