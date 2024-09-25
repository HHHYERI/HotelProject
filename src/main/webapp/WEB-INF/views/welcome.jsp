<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<body>
	<div class="container" style="height: 300px; text-align: center; ">
		<h1>${greeting}</h1>
		<p>${strapline}</p>
	<input type="text" id="filename" placeholder="Enter filename"/>
    <button type="button" onclick="loadFile()">Load Image</button>
    <div id="message"></div>
    <img id="fileImage" style="display:none;" />		
	</div>
    <script>
        function loadFile() {
            var filename = $('#filename').val();
            if (!filename) {
                $('#message').text('Please enter a filename.');
                return;
            }

            $.ajax({
                url: './resources/img/room/' + filename,
                type: 'GET',
                success: function(data, textStatus, jqXHR) {
                    var contentType = jqXHR.getResponseHeader('Content-Type');
                    if (contentType.startsWith('image/')) {
                        $('#fileImage').attr('src', URL.createObjectURL(new Blob([data], { type: contentType }))).show();
                        $('#message').text('Image loaded successfully.');
                    } else {
                        $('#message').text('File is not an image.');
                    }
                },
                error: function() {
                    $('#message').text('File not found or an error occurred.');
                },
                xhrFields: {
                    responseType: 'blob'
                }
            });
        }
    </script>
</body>
</html>

