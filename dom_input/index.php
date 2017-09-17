<!DOCTYPE html>
<head>
    <title>Parsing XML-MySQL</title>
</head>
<body>
    <center>
    <h1>Sample Aplikasi Sederhana XML</h1>
    <form action="action.php" method="POST">
        <table border="2">
            <tbody>
                <tr>
                    <td>Kode Barang</td>
                    <td><input id="kode" name="kode" type="text"></td>
                </tr>
                <tr>
                    <td>Nama Barang</td>
                    <td><input id="nama" name="nama" type="text"></td>
                </tr>
                <tr>
                    <td>Harga</td>
                    <td><input id="harga" name="harga" type="text"></td>
                </tr>
                <tr>  
                    <td><input id="submit" name="submit" type="submit" value="Kirim" onclick="document.location.reload(true)"></td>
                </tr>
            </tbody>
        </table>
    </form>
    <br><br>
        <?php
            $data = new SimpleXMLElement('barang.xml', null, true);
             
            ?>
            <table border="2">
                <tr>
                    <th>No</th>
                    <th>Kode Barang</th>
                    <th>Nama Barang</th>
                    <th>Harga</th>
                </tr>
            <?php
            $no =1;
            // melakukan looping penampilan data buku
            foreach($data as $a){ ?>
                    <tr>
                        <td><?php echo $no;?></td>
                        <td><?php echo $a->kode;?></td>
                        <td><?php echo $a->nama;?></td>
                        <td><?php echo $a->harga;?></td>
                    </tr>
            <?php
                $no++;
                }
            ?>
            </table>
</body>
</html>