<?php
$rowspan = count($header) + 1;
$level = 0;
$retstr = [];
foreach ($header as $i => $r) {
    $html1 = "<tr key='" . $i . "'>";
    $level++;
    foreach ($r as $keycolumn => $r1) {
        $span = "";
        if (isset($r1['cols']) && $r1['cols'])
            $span = "colspan='" . $r1['cols'] . "' ";
        else if (($rowspan - $level) > 1)
            $span = "rowspan='" . $rowspan - $level . "' ";

        $html1 .= "<th $span style='background-color:blue;border:1pt solid #333;'>";
        $html1 .= $r1['label'];
        $html1 .= "</th>";
    }
    $html1 .= "</tr>";

    $retstr[$i] = $html1;
}
sort($retstr);
// dump($cols);
// echo "<pre>";
// var_dump($rows1);
// return;
?>
<div>
<h4 style="text-align: center; margin-bottom: 0px;"><?= $title ?></h5>
<h4 style="text-align: center; margin-top: 0px;"><?= $tahun?></h4>
<?php if($nama_unit){?>
<h4 style="margin: 0px;">Unit Kerja : <?= $nama_unit?></h4>
<?php }?>
</div>
<div style=" display: inline-block;">


    <table style="width: 100%;">
        <thead>
            <?= implode("", $retstr) ?>
        </thead>
        <tbody>
            <?php foreach ($rows as $rws) {
                $k = 0;
                $cr = count($rws);
                $ck = [];
                foreach ($rws as $r) {
                    foreach ($r as $k => $v) {
                        if (!isset($ck[$k]))
                            $ck[$k] = 0;
                        else
                            $ck[$k]++;
                    }
                }
                $i = 0;
                $ic = [];
                foreach ($rws as $r) {
            ?>
                    <tr>
                        <?php
                        foreach ($cols as $column) {
                            if (!isset($ic[$column]))
                                $ic[$column] = 0;
                            else
                                $ic[$column]++;
    
                            $rowspan = 1;
                            if (!isset($ck[$column])) { ?>
                                <td style='border:1pt solid #333;' rowspan="<?= $rowspan > 1 ? $rowspan : null ?>"><i><?=$column?></i></td>
                                <?php } else {
                                if ($ic[$column] == $ck[$column])
                                    $rowspan = $cr - $ck[$column];
    
                                if (in_array($column, array_keys($r))) { ?>
                                    <td style='border:1pt solid #333;' rowspan="<?= $rowspan > 1 ? $rowspan : null ?>">
                                        <?= $r[$column] ?>
                                    </td>
                        <?php }
                            }
                        } ?>
                    </tr>
            <?php $i++;
                }
            } ?>
        </tbody>
    </table>
    <?php if($nama_jabatan){?>
   
    <p style=" text-align: right; margin: 0px;">Jakarta,<?= $tanggal?></p>
    <p style=" text-align: right; margin: 0px;">Mengetahui,</p>
    <p style=" text-align: right; margin: 0px; margin-bottom: 40px;"><?= $nama_unit ?></p>
    <p style="text-align:right; margin: 0px;">&nbsp;</p>
    <p style="text-align:right; margin: 0px;">&nbsp;</p>
    <p style=" text-align: right; margin: 0px;"><?= $nama_user ?></p>
    <p style=" text-align: right; margin: 0px;"><?= $nama_jabatan?></p>

    <?php }?>


</div>    

<style>
    @page {
        size: A4 portrait;
    }

    table {
        border-spacing: 0px;
        border-collapse: collapse;
    }
</style>