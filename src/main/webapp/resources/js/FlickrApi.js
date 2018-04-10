class FlickrApi{
	constructor(){
		this.url = 'http://api.flickr.com/services/rest/?jsoncallback=?'; // jasonP
																			// 처리.
		this.api_key = '4aac68dcdfa1c835481d9c2254155f25';
		this.format = 'json';
	}
	
	getRecent(parse){
		parse = parse || this.parse; // 값을 설정하지 않았다면 defualt가 되서 this.parse.가
										// 가고 값을 지정했다면 매개변수 parse로 바꿔줌.
		
		var param = {
				api_key : this.api_key,
				method : 'flickr.photo.getRecent',
				per_page : 20,
				format : this.format
		};		
		// getJSON으로 호출했지만 callback이 있으면 JSONP호출을 하겠다라고 자동으로 처리.
		$.getJSON(this.url, param, parse);
	}
	
	search(keyword,parse){
		parse = parse||this.parse;
		
		var param = {
				api_key : this.api_key,
				method : 'flickr.photos.search',
				// text : keyword,
				tags : keyword,
				content_type : 1,
				safe_search : 1,
				sort : 'interestingness-desc',
				per_page : 5,
				per_page : 10,
				format : this.format
				};
				$.getJSON(this.url, param, parse);
				}
	
	parse(data) {
		
		$('#panel').empty();
		
		$(data.photos.photo).each(function(i,photo){
			
			
			
			var img =`http://farm${photo.farm}.staticflickr.com/
				${photo.server}/${photo.id}_${photo.secret}.jpg`;			
			var img_info =`http://www.flickr.com/photos/${photo.owner}/
				${photo.id}/in/photostream`;
			
			var templ = `<div class = "text-center col-md-4 mb-4">
			
			<a href ="${img_info}" target = "_black">
			<img src = "${img}" width = "240" height = "150" class = "rounded example hoverable">
			</a>
			</div>
			`;
			
			$(templ).appendTo(`#panel`);
		
		
		})
		
		
/*
 * $(data.photos.photo).each(function(i, photo){ // 작은 이미지 var img
 * =`http://farm${photo.farm}.staticflickr.com/
 * ${photo.server}/${photo.id}_${photo.secret}.jpg`; console.log(img); // 이미지 정보
 * 페이지 var img_info =`http://www.flickr.com/photos/${photo.owner}/
 * ${photo.id}/in/photostream`; console.log(img_info) });
 */
		}
}