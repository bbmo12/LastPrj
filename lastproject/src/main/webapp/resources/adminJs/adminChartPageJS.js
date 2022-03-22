//개수 불러오는 함수
function adminCount() {
    $.ajax({
        url : 'adminCount',
        method : 'get',
        success : function(res) {
            console.log(res.petCount);
            console.log(res.pmemCount);
            console.log(res.memCount);
            $("#admMemberC").append(res.memCount+"명");
            $("#admPmemberC").append(res.pmemCount+"명");
            $("#admPetC").append(res.petCount+"마리");
            
        },error : function(error) {
            alert('Count를 불러오는 데 오류가 있습니다')
            return false;
            
        }
        
    });
    
}

// 아코디언 함수
$(document).on("click", ".que", function() {
    $(this).next(".anw").stop().slideToggle(300);
    $(this).toggleClass('on').siblings().removeClass('on');
    $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
})//end 아코디언 함수


//div admPetChartA 클래스 클릭시 함수
$(document).on("click",".admPetChartA" ,function(){
    $(".admPetChart").append("<canvas id='admPetChart'></canvas>");
     $("#admPetChart").remove();
     petChart();
 function petChart() {// 품 종별 Bar 차트 그리기

    tt = [];
    oo = [];

    var total;
    ip = [];
    $.ajax({
        url : 'amdPetChart',
        method : 'get',
        success : function(res) {
            $.each(res, function(i) {
                tt.push(res[i].tt);
                oo.push(res[i].oo);
                console.log(res[i].oo);
                ip += ` \${res[i].oo} 마릿 수 : \${res[i].tt}`;
                
            });
            console.log(ip);
            $("#ip").html(ip);
            console.log(res[0].ch);
            $("#a").html("총 마리수 : " + res[0].ch);


            const txc = document.getElementById('admPetChart').getContext('2d');
            const admPetChart = new Chart(txc, {
                type : 'bar',
                data : {
                    labels : oo,
                    datasets : [ {
                        label : '# of Votes',
                        data : tt,
                        backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
                                'rgba(255, 159, 64, 0.2)',
                                'rgba(255, 159, 64, 0.2)' ],
                        borderColor : [ 'rgba(255, 99, 132, 1)',
                                'rgba(255, 159, 64, 1)',
                                'rgba(255, 159, 64, 1)' ],
                        borderWidth : 1
                    } ]
                },
                options : {
                    scales : {
                        y : {
                            beginAtZero : true
                        }
                    }
                }
            });
        }
    })

} 

});


//div admPartChartA 클릭시 차트 그려짐
$(document).on("click",".admPartChartA" ,function(){
   $(".admPartChart").append("<canvas id='admPartChart'></canvas>");
   $("#admPartChart").remove();

   partChart();

   function partChart() { //일반 회원 기간 별 차트 그리기
        
       tt = [];
       oo = [];
       aa = [];
       bb = [];
       $.ajax({
           url : 'admMemChart',
           method : 'get',
           success : function(res) {
               console.log(res);
               console.log(res.memChart[0].tt);
               console.log(res.memChart[0].oo); 
               console.log(res.pmemChart[0].aa);
               console.log(res.pmemChart[0].bb);
               var pmem = res.pmemChart;
               var mem = res.memChart;
                $.each(pmem,function(i){
                   aa.push(res.pmemChart[i].aa);
                   bb.push(res.pmemChart[i].bb);
               });
                $.each(mem,function(i){
                       tt.push(mem[i].tt);
                       oo.push(mem[i].oo);
               }); 
                
                console.log(tt);
                console.log(oo);

                const ctx = document.getElementById('admPartChart')
                       .getContext('2d');
               const admPartChart = new Chart(ctx, {
                   type : 'line',
                   data : {
                       labels : tt,aa,
                       datasets : [ {
                           label : '일반 회원',
                           data : oo,
                           backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
                                   'rgba(255, 159, 64, 0.2)', ],
                           borderColor : [ 'rgba(255, 99, 132, 1)',
                                   'rgba(255, 159, 64, 1)' ],
                           borderWidth : 1
                       } ,
                        {
                           label : '파트너 회원',
                           data : bb,
                           backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
                                   'rgba(255, 159, 64, 0.2)', ],
                           borderColor : [ 'rgba(255, 99, 132, 1)',
                                   'rgba(255, 159, 64, 1)' ],
                           borderWidth : 1
                       } ]
                   },
                   options : {
                       scales : {
                           y : {
                               beginAtZero : true
                           }
                       }
                   }
               }); 
           } //success

       }) // ajax

   } //
   
});