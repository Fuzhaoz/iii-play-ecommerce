
            var clientId='80q4r4u7vheclcznnrj5rw7romv7nys'
            var limit=2;
            var apiUrl='https://api.twitch.tv/kraken/streams/?client_id='+clientId+'&game=League%20of%20Legends&limit='+limit;
                       
                var xhr = new XMLHttpRequest();
                xhr.open("GET", apiUrl, true);
                // xhr.setRequestHeader("client-id",clientId);
                xhr.send();
                
                xhr.onreadystatechange = function() {
                    // 伺服器請求完成
                    if (this.readyState == 4 && this.status === 200) {
                        var data = JSON.parse(this.responseText);
                        console.log(data)
                         
                        
                    }
                }
         
        
        
