<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <div class="col-lg-12 grid-margin stretch-card container mt-3">
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">파트너회원</h4>
                <p class="card-description">
                    Add class
                    <code>.table-striped</code>
                </p>
                <input class="form-control" id="myInput" type="text" placeholder="Search..">
                <br>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>PartnerShip</th>
                            <th>이름</th>
                            <th>신고제재</th>
                            <th>매출</th>
                            <th>가입날짜</th>
                            <th>승인여부</th>
                        </tr>
                    </thead>
                    <tbody id="myTable">
                        <tr>
                            <td class="py-1"><a href="#"><img src="resources/assets123/images/faces-clipart/pic-1.png"
                                        alt="image" /></a></td>
                            <td>Herman Beck</td>
                            <td><meter value="75" min="0" max="100" low="20" high="65" optimum="15"
                                    style="width: 100%"></meter></td>
                            <td>$ 77.99</td>
                            <td>May 15, 2015</td>
                            <td><button onclick="permit()">승인</button>
                                <button onclick="cancel()">거절</button></td>
                        </tr>
                        <tr>
                            <td class="py-1"><a href="#"> <img src="resources/assets123/images/faces-clipart/pic-2.png"
                                        alt="image" /></a></td>

                            <td>Messsy Adam</td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 75%"
                                        aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </td>
                            <td>$245.30</td>
                            <td>July 1, 2015</td>
                        </tr>
                        <tr>
                            <td class="py-1"><img src="resources/assets123/images/faces-clipart/pic-3.png"
                                    alt="image" /></td>
                            <td>John Richards</td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 90%"
                                        aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </td>
                            <td>$138.00</td>
                            <td>Apr 12, 2015</td>
                        </tr>
                        <tr>
                            <td class="py-1"><img src="resources/assets123/images/faces-clipart/pic-4.png"
                                    alt="image" /></td>
                            <td>Peter Meggik</td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar bg-primary" role="progressbar" style="width: 50%"
                                        aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </td>
                            <td>$ 77.99</td>
                            <td>May 15, 2015</td>
                        </tr>
                        <tr>
                            <td class="py-1"><img src="resources/assets123/images/faces-clipart/pic-1.png"
                                    alt="image" /></td>
                            <td>Edward</td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 35%"
                                        aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </td>
                            <td>$ 160.25</td>
                            <td>May 03, 2015</td>
                        </tr>
                        <tr>
                            <td class="py-1"><img src="resources/assets123/images/faces-clipart/pic-2.png"
                                    alt="image" /></td>
                            <td>John Doe</td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 65%"
                                        aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </td>
                            <td>$ 123.21</td>
                            <td>April 05, 2015</td>
                        </tr>
                        <tr>
                            <td class="py-1"><img src="resources/assets123/images/faces-clipart/pic-3.png"
                                    alt="image" /></td>
                            <td>Henry Tom</td>
                            <td>
                                <div class="progress">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 20%"
                                        aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </td>
                            <td>$ 150.00</td>
                            <td>June 16, 2015</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });



        function permit() {

        }

        function cancel() {

        }
    </script>
</body>

</html>