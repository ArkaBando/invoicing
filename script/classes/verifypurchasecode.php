<?php

public function verifyPurchaseCode($settings) {
         $purchaseKey = "";
        if (isset($settings["purchase_code"])) {
            $purchaseKey = $settings["purchase_code"];
        } else {
            echo "Please update your config file & enter purchase code";
            return false;
        }
        if (empty($purchaseKey)) {
            echo "Please enter purchase code in config file.";
            return false;
        }

        $connected = @fsockopen("www.google.com", 80);
        if (!$connected) {
            return true;
        }

        if (!in_array('curl', get_loaded_extensions())) {
            return true;
        }

        $fileSavePath = $settings["downloadFolder"];
        $fileName = "verify.txt";

        if (file_exists($fileSavePath . $fileName)) {
            $fp = fopen($fileSavePath . $fileName, 'r');
            $savedpurchaseKey = fgets($fp);
            if ($purchaseKey === $savedpurchaseKey) {
                return true;
            }
        }

		    $url = "https://api.envato.com/v3/market/author/sale?code=" . $purchaseKey;
            $curl = curl_init($url);
            $personalToken = "9q95nUsJD3YBdDgqBHISJ5BkYHDAA9Sf";
            $header = array();
            $header[] = 'Authorization: Bearer ' . $personalToken;
            $header[] = 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:41.0) Gecko/20100101 Firefox/41.0';
            $header[] = 'timeout: 20';
            curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, 5);
            $envatoRes = curl_exec($curl);
            curl_close($curl);
            $envatoRes = json_decode($envatoRes);

           if (isset($envatoRes->item->name)) {
                 if ($fileSavePath && !is_dir($fileSavePath))
                    mkdir($fileSavePath);

                    $fp = fopen($fileSavePath . $fileName, 'w');
                    fwrite($fp, $purchaseKey);
                    fclose($fp);
                    return true;
            } else {
                echo "Please enter valid purchase code in config file.";
                return false;
            }
      }


?>