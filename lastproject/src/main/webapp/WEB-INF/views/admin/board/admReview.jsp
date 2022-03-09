<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
    <table class="sortable paginated">
        <caption>베스트셀러</caption>
        <thead>
            <tr>
                <th></th>
                <th class="sorting">순위</th>
                <th class="sorting">책제목</th>
                <th class="sorting">저자</th>
                <th class="sort-date">출판사</th>
                <th class="sorting">가격</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/061/864/06186469.jpg?type=m1"> </td> <td>1
                </td>
                <td>덕혜옹주</td>
                <td>권비영</td>
                <td>다산책방</td>
                <td>11,800원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/062/277/06227737.jpg?type=m1"> </td> <td>2
                </td>
                <td>삼성을 생각한다</td>
                <td>김용철</td>
                <td>사회평론</td>
                <td>22,000원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/061/962/06196209.jpg?type=m1"> </td> <td>3
                </td>
                <td>오츠 슈이치</td>
                <td>21세기북스</td>
                <td>12,000원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/062/123/06212320.jpg?type=m1"> </td> <td>4
                </td>
                <td>시크릿 두 번째 이야기</td>
                <td>폴 해링턴</td>
                <td>살림</td>
                <td>12,000원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/060/537/06053729.jpg?type=m1"> </td> <td>5
                </td>
                <td>1Q84</td>
                <td>무라카미 하루키</td>
                <td>문학동네</td>
                <td>14,800원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/061/932/06193283.jpg?type=m1"> </td> <td>6
                </td>
                <td>마법의 돈관리</td>
                <td>고득영</td>
                <td>국일미디어</td>
                <td>12,000원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/061/972/06197265.jpg?type=m1"> </td> <td>7
                </td>
                <td>박철범의 하루공부법</td>
                <td>박철범</td>
                <td>다산에듀</td>
                <td>12,000원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/049/791/04979122.jpg?type=m1"> </td> <td>8
                </td>
                <td>엄마를 부탁해</td>
                <td>신경숙</td>
                <td>창비</td>
                <td>10,000원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/060/474/06047439.jpg?type=m1"> </td> <td>9
                </td>
                <td>아이의 사생활</td>
                <td>EBS</td>
                <td>지식채널</td>
                <td>16,800원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/060/376/06037660.jpg?type=m1"> </td> <td>10
                </td>
                <td>그건, 사랑이였네</td>
                <td>한비야</td>
                <td>푸른숲</td>
                <td>12,000원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/062/246/06224688.jpg?type=m1"> </td> <td>11
                </td>
                <td>김연아의 7분 드라마</td>
                <td>김연아</td>
                <td>중아출판사</td>
                <td>15,000원</td>
            </tr>

            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/062/171/06217189.jpg?type=m1"> </td> <td>12
                </td>
                <td>아버지의 눈물</td>
                <td>김정현</td>
                <td>문이당</td>
                <td>11,000원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/029/108/02910899.jpg?type=m1"> </td> <td>13
                </td>
                <td>쓸만한 아이</td>
                <td>이금이</td>
                <td>푸른책들</td>
                <td>8,800원</td>
            </tr>
            <tr>
                <td>
                    <imgsrc="http://bookthumb.phinf.naver.net/cover/052/586/05258669.jpg?type=m1"> </td> <td>14
                </td>
                <td>일본전산이야기</td>
                <td>감성호</td>
                <td>쌤앤파커스</td>
                <td>14,500원</td>
            </tr>
        </tbody>
    </table>

    <script>
        $('table.paginated').each(function () {
            var currentPage = 0;
            var numPerPage = 5;
            var $table = $(this);
            var repaginate = function () {
                $table.find('tbody tr').hide()
                    //기본적으로 모두 감춘다
                    .slice(currentPage * numPerPage,
                        (currentPage + 1) * numPerPage)
                    .show();
                //현재페이지+1 곱하기 현재페이지까지 보여준다
            };
            var numRows = $table.find('tbody tr').length;
            //length로 전체길이구함
            var numPages = Math.ceil(numRows / numPerPage);
            //Math.ceil를 이용하여 반올림
            var $pager = $('<div class="pager"> </div>');
            //pager라는 클래스의 div엘리먼트 작성
            for (var page = 0; page < numPages; page++) {
                $('<span class="page-number"></span>').text(page + 1)
                    .bind('click', {
                        newPage: page
                    }, function (event) {
                        currentPage = event.data['newPage'];
                        repaginate();
                        //for구문을 이용하여 페이지 수만큼
                        //버튼을 구현
                        $(this).addClass('active')
                            //활성화된페이지에는 active라는 클래스명을 붙여준다.
                            .siblings().removeClass('active');
                    }).appendTo($pager).addClass('clickable');
            }
            $pager.insertBefore($table)
                //앞서 설정한 페이지키를 삽입
                .find('span.page-number:first').addClass('active');
        });
        $(document).ready(function () {
            $('table.paginated').each(function () {
                var currentPage = 0;
                var numPerPage = 5;
                var $table = $(this);

                $table.bind('repaginate', function () {
                    $table.find('tbody tr').hide()
                        .slice(currentPage * numPerPage,
                            (currentPage + 1) * numPerPage)
                        .show();
                });

                var numRows = $table.find('tbody tr').length;
                var numPages = Math.ceil(numRows / numPerPage);
                var $pager = $('<div class="pager"></div>');
                for (var page = 0; page < numPages; page++) {
                    $('<span class="page-number"></span>').text(page + 1)
                        .bind('click', {
                            newPage: page
                        }, function (event) {
                            currentPage = event.data['newPage'];
                            $table.trigger('repaginate');
                            $(this).addClass('active')
                                .siblings().removeClass('active');
                        }).appendTo($pager).addClass('clickable');
                }
                $pager.insertBefore($table)
                    .find('span.page-number:first').addClass('active');
            });
        });
        $table.find('th').removeClass('sorted-asc')
            .removeClass('sorted-desc');
        if (sortDirection == 1) {
            $header.addClass('sorted-asc');
        } else {
            $header.addClass('sorted-desc');
        }
        $table.alternateRowColors();

        $table.trigger('repaginate');
    </script>
</body>

</html>