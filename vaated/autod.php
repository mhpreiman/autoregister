<div class="tab-pane active" id="panel-cars">
                        <h3> Sisesta uus auto</h3>
                        <form class="form-horizontal" role="form" method="POST" action="">
                            
                            <div class="form-group">
                                <label for="regnr" class="col-sm-2 control-label">
                                    Registrinumber
                                </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="regnr" name="regnr" maxlength="9" pattern=".{9,}"  oninput="this.value=this.value.replace(/[^a-zA-Z0-9]/g,'');" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="regpiirk" class="col-sm-2 control-label">
                                    Registri piirkond
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" id="regpiirk" name="regpiirk"  required>
                                        <option value="" ></option>
                                        <?php foreach($carRegCity as $city) { ?>
                                           <option value="<?php  echo $city['linnid']; ?>" ><?php  echo $city['nimi']; ?></option> 
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mark" class="col-sm-2 control-label">
                                   Mark
                                </label>
                                <div class="col-sm-3">
                                    <select class="form-control" id="mark" name="mark"  required>
                                        <option value="" ></option>
                                        <?php foreach($carBrands as $brand) { ?>
                                           <option value="<?php  echo $brand['mark']; ?>" ><?php  echo ucfirst($brand['mark']); ?></option> 
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="aasta" class="col-sm-2 control-label">
                                    Aasta
                                </label>
                                <div class="col-sm-3">
                                    <div class="input-group date">
                                        <input type="text" class="form-control  datepicker-autod" id="aasta" name="aasta" required>
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
                                    </div>
                                </div> 
                            </div>
                            <div class="form-group">
                               
                                <div class="col-sm-offset-2 col-sm-10">

                                    <button type="submit" class="btn btn-default" name="autoPOST">Salvesta</button>
                                </div>
                            </div>
                        </form>
                    </div>