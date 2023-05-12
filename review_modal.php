

<div class="modal fade" id="addnew">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              <h4 class="modal-title"><b>Add New Review</b></h4>
            </div>
            <div class="modal-body">
              <form class="form-horizontal" method="POST" action="review_add.php?proid=<?php echo $myproduct["prodid"];?>&product=<?php echo $_GET['product'];?>">
                <div class="form-group">
                    <div class="col-sm-12" style="display:flex; justify-content:center">
                        <fieldset class="rating">
                            <input type="radio" id="star5" name="rating" value="5" />
                            <label for="star5">5 stars</label>
                            <input type="radio" id="star4" name="rating" value="4" />
                            <label for="star4">4 stars</label>
                            <input type="radio" id="star3" name="rating" value="3" />
                            <label for="star3">3 stars</label>
                            <input type="radio" id="star2" name="rating" value="2" />
                            <label for="star2">2 stars</label>
                            <input type="radio" id="star1" name="rating" value="1" />
                            <label for="star1">1 star</label>
                        </fieldset>
                    </div>
                    <label for="name" class="col-sm-3 control-label">Review</label>
                    <div class="col-sm-9">
                      <input type="text" class="form-control" id="text" name="text" required>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Close</button>
              <button type="submit" class="btn btn-primary btn-flat" name="add"><i class="fa fa-save"></i> Save</button>
              </form>
            </div>
        </div>
    </div>
</div>
<style>
.rating {
    float:left;
    border:none;
}
.rating:not(:checked) > input {
    position:absolute;
    top:-9999px;
    clip:rect(0, 0, 0, 0);
}
.rating:not(:checked) > label {
    float:right;
    width:1em;
    padding:0 .1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:200%;
    line-height:1.2;
    color:#ddd;
}
.rating:not(:checked) > label:before {
    content:'★ ';
}
.rating > input:checked ~ label {
    color: #f70;
}
</style>