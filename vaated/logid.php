<div class="tab-pane" id="panel-logs">
    <h3>Logitud muudatused</h3>
    <div class="panel panel-default"><!-- Default panel contents -->
        <table class="table">
            <thead >
                 <tr class="active">
                     <th>Toiming</th>
                     <th>Aeg</th>
                     <th>Registrinumber</th>
                     <th>Piirkond</th>
                     <th>Mark</th>
                    <th>Aasta</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($logs as $log) {   ?>
                <tr>
                    <td> <?php echo $log['toiming'];  ?></td>
                    <td> <?php echo substr($log['aeg'],0,16)  ?></td>
                    <td> <?php echo $log['regnr'];  ?></td>
                    <td> <?php echo $log['nimi'];  ?></td>
                    <td> <?php echo ucfirst ($log['mark']);  ?></td>
                    <td> <?php echo $log['aasta'];  ?></td>
                </tr>
            <?php  } ?>
        </tbody>
        </table>
    </div>
</div>

