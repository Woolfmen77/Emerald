<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
</head>
<body>

<nav class="py-2 bg-light border-bottom">
    <div class="container d-flex flex-wrap">
        <ul class="nav me-auto">
            <li class="nav-item"><a href="/" class="nav-link link-dark px-2 active" aria-current="page">Home</a></li>
            <li class="nav-item"><a href="/property/list" class="nav-link link-dark px-2">Property-list</a></li>
            <li class="nav-item"><a href="/property/categorySall" class="nav-link link-dark px-2">Sall</a></li>
            <li class="nav-item"><a href="/property/categoryRental" class="nav-link link-dark px-2">Rental</a></li>
            <li class="nav-item"><a href="/owner" class="nav-link link-dark px-2">Owner</a></li>

        </ul>
        <ul class="nav">
            <li class="nav-item"><a href="/log" class="nav-link link-dark px-2">Login</a></li>
            <li class="nav-item"><a href="/registration" class="nav-link link-dark px-2">Sign up</a></li>
        </ul>
    </div>
</nav>
<header class="py-3 mb-4 border-bottom">
    <div class="container d-flex flex-wrap justify-content-center">
        <a href="/" class="d-flex align-items-center mb-3 mb-lg-0 me-lg-auto text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32">
                <use xlink:href="#bootstrap"></use>
            </svg>
            <span class="fs-4">Double header</span>
        </a>
        <form class="col-12 col-lg-auto mb-3 mb-lg-0">
            <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
        </form>
    </div>
</header>

<main>

    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">пример альбома</span></span>
                </h1>
                <p class="lead text-muted"><span style="vertical-align: inherit;"><span
                        style="vertical-align: inherit;">Краткое описание альбома ниже (его содержание, его создатель и т.д.). </span><span
                        style="vertical-align: inherit;">Сделайте его коротким и милым, но не слишком коротким, чтобы люди не пропустили этот альбом полностью.</span></span>
                </p>
                <p>
                    <a href="#" class="btn btn-primary my-2"><span style="vertical-align: inherit;"><span
                            style="vertical-align: inherit;">Главный призыв к действию</span></span></a>
                    <a href="#" class="btn btn-secondary my-2"><span style="vertical-align: inherit;"><span
                            style="vertical-align: inherit;">второстепенная работа</span></span></a>
                </p>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-light">
        <div class="container">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Заполнитель: Миниатюра"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"></rect>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">صورة مصغرة</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text"><span style="vertical-align: inherit;"><span
                                    style="vertical-align: inherit;">Это qqqqqqqqqqqqqqqqqqqqqqболее широкая карточка со вспомогательным текстом ниже, как естественное введение в дополнительный контент. </span><font
                                    style="vertical-align: inherit;">Этот контент немного длиннее.</font></span></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><span
                                            style="vertical-align: inherit;"><span
                                            style="vertical-align: inherit;">Предложение</span></span></button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><span
                                            style="vertical-align: inherit;"><span
                                            style="vertical-align: inherit;">Изменить</span></span></button>
                                </div>
                                <small class="text-muted"><span style="vertical-align: inherit;"><span
                                        style="vertical-align: inherit;">9 минут</span></span></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Заполнитель: Миниатюра"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"></rect>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">صورة مصغرة</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">Это более широкая карточка со вспомогательным
                                текстом ниже, как естественное введение в дополнительный контент. </font><font
                                    style="vertical-align: inherit;">Этот контент немного длиннее.</font></font></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Предложение</font></font>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Изменить</font></font>
                                    </button>
                                </div>
                                <small class="text-muted"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">9 минут</font></font></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Заполнитель: Миниатюра"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"></rect>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">صورة مصغرة</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">Это более широкая карточка со вспомогательным
                                текстом ниже, как естественное введение в дополнительный контент. </font><font
                                    style="vertical-align: inherit;">Этот контент немного длиннее.</font></font></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Предложение</font></font>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Изменить</font></font>
                                    </button>
                                </div>
                                <small class="text-muted"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">9 минут</font></font></small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Заполнитель: Миниатюра"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"></rect>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">صورة مصغرة</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">Это более широкая карточка со вспомогательным
                                текстом ниже, как естественное введение в дополнительный контент. </font><font
                                    style="vertical-align: inherit;">Этот контент немного длиннее.</font></font></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Предложение</font></font>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Изменить</font></font>
                                    </button>
                                </div>
                                <small class="text-muted"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">9 минут</font></font></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Заполнитель: Миниатюра"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"></rect>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">صورة مصغرة</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">Это более широкая карточка со вспомогательным
                                текстом ниже, как естественное введение в дополнительный контент. </font><font
                                    style="vertical-align: inherit;">Этот контент немного длиннее.</font></font></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Предложение</font></font>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Изменить</font></font>
                                    </button>
                                </div>
                                <small class="text-muted"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">9 минут</font></font></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Заполнитель: Миниатюра"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"></rect>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">صورة مصغرة</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">Это более широкая карточка со вспомогательным
                                текстом ниже, как естественное введение в дополнительный контент. </font><font
                                    style="vertical-align: inherit;">Этот контент немного длиннее.</font></font></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Предложение</font></font>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Изменить</font></font>
                                    </button>
                                </div>
                                <small class="text-muted"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">9 минут</font></font></small>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Заполнитель: Миниатюра"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"></rect>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">صورة مصغرة</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">Это более широкая карточка со вспомогательным
                                текстом ниже, как естественное введение в дополнительный контент. </font><font
                                    style="vertical-align: inherit;">Этот контент немного длиннее.</font></font></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Предложение</font></font>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Изменить</font></font>
                                    </button>
                                </div>
                                <small class="text-muted"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">9 минут</font></font></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Заполнитель: Миниатюра"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"></rect>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">صورة مصغرة</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">Это более широкая карточка со вспомогательным
                                текстом ниже, как естественное введение в дополнительный контент. </font><font
                                    style="vertical-align: inherit;">Этот контент немного длиннее.</font></font></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Предложение</font></font>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Изменить</font></font>
                                    </button>
                                </div>
                                <small class="text-muted"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">9 минут</font></font></small>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card shadow-sm">
                        <svg class="bd-placeholder-img card-img-top" width="100%" height="225"
                             xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Заполнитель: Миниатюра"
                             preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title>
                            <rect width="100%" height="100%" fill="#55595c"></rect>
                            <text x="50%" y="50%" fill="#eceeef" dy=".3em">صورة مصغرة</text>
                        </svg>

                        <div class="card-body">
                            <p class="card-text"><font style="vertical-align: inherit;"><font
                                    style="vertical-align: inherit;">Это более широкая карточка со вспомогательным
                                текстом ниже, как естественное введение в дополнительный контент. </font><font
                                    style="vertical-align: inherit;">Этот контент немного длиннее.</font></font></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Предложение</font></font>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary"><font
                                            style="vertical-align: inherit;"><font style="vertical-align: inherit;">Изменить</font></font>
                                    </button>
                                </div>
                                <small class="text-muted"><font style="vertical-align: inherit;"><font
                                        style="vertical-align: inherit;">9 минут</font></font></small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</main>

<footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
        <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
    </ul>
    <p class="text-center text-muted">© 2021 Company, Inc</p>
</footer>


<div class="goog-te-spinner-pos">
    <div class="goog-te-spinner-animation">
        <svg xmlns="http://www.w3.org/2000/svg" class="goog-te-spinner" width="96px" height="96px" viewBox="0 0 66 66">
            <circle class="goog-te-spinner-path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33"
                    r="30"></circle>
        </svg>
    </div>
</div>
</body>
</html>
