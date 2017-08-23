require(["../lib/common"], function(Common) {
	require(["vue", "OrderModel", 'requester',"touch","urlPram",'dropload'],  function (Vue, OrderModel, Requester){
		
		var order=new OrderModel();
		var proVm;
		var requester = new Requester();
		var pageNo = 1;

		requester.ajax({
			url:'m/estimate/getUnvaluedList',
			type:'GET',
			success:function(data){
				//console.log(JSON.stringify(data))
				if(!data){	//当没有可评价商品的时候，调用haveNoInformation，提示
					return 	haveNoInformation({reminder:'暂无相关信息，<a href="index.html" style="color: #ff6c00;">去逛逛</a>'});
				}
				for (var i =0, len=data.list.length; i<len ;i++) {
					data.list[i].createDate=new Date(data.list[i].createDate).Format('yyyy-MM-dd hh:mm:ss');
				}		
				proVm=new Vue({
					el: '#evaluateCtn',
                	data : {
                		details: data.list,
                		pageNo:1,
                		hasNextPage:false
                	}

				}); 	
			}
		});

		
		//加载未评价的列表
		var dropload = $(".order-group").dropload({
	        scrollArea : window,
	        autoLoad: false,
	        loadDownFn : loadMoreUnvaluedlist
	    })

		function loadMoreUnvaluedlist(me){
			requester.ajax({
				url:'m/estimate/getUnvaluedList',
				data:{pageNo : (proVm.$data.pageNo+1)},
				type:'GET',
				success:function(data){
					for (var i =0, len=data.list.length; i<len ;i++) {
						data.list[i].createDate=new Date(data.list[i].createDate).Format('yyyy-MM-dd hh:mm:ss');
					}
					proVm.$data.details= proVm.$data.details.concat(data.list);
					proVm.$data.pageNo = data.pageNum;
		        	proVm.$data.hasNextPage = data.hasNextPage;
		        	me.resetload();//从新计算drooload的对象
		        	if(!data.hasNextPage){
						me.lock();
					}
				}
			});
		}
	});
});
