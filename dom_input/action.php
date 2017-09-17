<?php
          // 1. KONEKSI KE DATABASE
        mysql_connect("localhost", "root", "");
        mysql_select_db("db_bnet");
 
        // 2. MENGAMBIL DATA DARI INPUT FORM
        $kode   = $_POST["kode"];
        $nama   = $_POST["nama"];
        $harga  = $_POST["harga"];
 
        // 3. MEMASUKKAN DATA KE DATABASE
        if($kode != ''){
            $query = "INSERT INTO barang VALUES ('$kode', '$nama', '$harga')";
            mysql_query($query);
            echo "Sukses Input Data Baru <b>$nama</b>";
            header("location: index.php");
        }else{
            echo "Gagal";
        }
 
        // 4. MENGAMBIL DATA DARI DATABASE
        $namaTabel = "barang";
 
        $query      = "SELECT * FROM $namaTabel";
        $hasil      = mysql_query($query);
        $jumField   = mysql_num_fields($hasil);
        $sites      = array();
 
        while ($data = mysql_fetch_array($hasil))
        {
            $sites [] = array('kode_barang' => $data['kode_barang'], 'nama_barang' => $data['nama_barang'], 'harga' => $data['harga']);
        }
 
        // 5. PARSING DATA SQL -> XML Document : print_r($sites);
        $document = new DOMDocument();
        $document->formatOutput = true;
 
        $root = $document->createElement( "data" );
        $document->appendChild( $root );
 
        foreach( $sites as $book )
        {
            $block = $document->createElement( "barang" );
 
            $kode = $document->createElement( "kode" );
            $kode->appendChild(
            $document->createTextNode( $book['kode_barang'] )
            );
            $block->appendChild( $kode );
 
            $nama = $document->createElement( "nama" );
            $nama->appendChild(
            $document->createTextNode( $book['nama_barang'] )
            );
            $block->appendChild( $nama );
 
            $harga = $document->createElement( "harga" );
            $harga->appendChild(
            $document->createTextNode( $book['harga'] )
            );
            $block->appendChild( $harga);
 
            $root->appendChild( $block );
            }
 
            // 6. MENYIMPAN DATA DALAM BENTUK FILE linksp.xml
            $document->save("barang.xml");

    ?>