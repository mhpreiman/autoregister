<div class="tab-pane" id="panel-cities">
                        <h3> Sisesta uus linn</h3>
                        <form class="form-horizontal" role="form" method="POST" action="">
                            
                            <div class="form-group">
                                <label for="linn" class="col-sm-2 control-label">
                                    Linn
                                </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="linn" name="linn" maxlength="25"  oninput="this.value=this.value.replace(/[^a-zA-ZüõöäÜÕÖÄ-]/g,'');" required/>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="rahvaarv" class="col-sm-2 control-label">
                                    Rahvaarv
                                </label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" id="rahvaarv" name="rahvaarv" maxlength="7"  oninput="this.value=this.value.replace(/[^0-9]/g,'');" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-default" name="linnPOST">Salvesta</button>
                                </div>
                            </div>
                        </form>
                    </div>