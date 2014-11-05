$(document).ready(function() {
	
 	 //console.info('load main js');
	 var bs = { sel: false };
     var bd = $('#bt_del');
     var be = $('#bt_edit');
     var a_suc = $('#a_suc');
     var a_add = $('#a_add');
     var a_ed = $('#a_ed');
     var a_err = $('#a_err');
     var f = 	$("#dForm");
     var v_name = $('input[name="username"]');
	 var v_phone = $('input[name="phoneNumber"]');
     var v_date = $('input[name="date"]');
     var v_note = $('input[name="note"]');
     var t_sel; 
     var m = $('#myModal');
	 var mt = $('h4.modal-title'); 
      
      
	 var table = $('#example').DataTable();
	 
	 $('#example tbody').on( 'click', 'tr', function () {
				if ( $(this).hasClass('selected') ) {
					$(this).removeClass('selected');
					bs.sel = false;
					bd.addClass('disabled');
					be.addClass('disabled');
				}
				else {
					table.$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
					if(table.row( this ).length == 0)
						{
						   return false;	  	
						}    
					bs.sel = true;
					var t_arr = table.row( this ).data();
					bs.id = t_arr[0];
					bd.removeClass('disabled');
					be.removeClass('disabled');
					t_sel = t_arr;
				}

      } );
	
	
	 $('#bt_del').click( function () {
               if( bs.sel == true ) 
                   {
  	                   $.ajax({
											   type: "POST",
											   url: "../delete/"+bs.id,
											   data: bs.id,
											   success: function(msg){
													table.row('.selected').remove().draw( false );
													a_suc.fadeIn(1000);
												    a_suc.fadeOut(1000);
												    bd.addClass('disabled');
												    be.addClass('disabled');
												},
											    error: function(){
												    a_err.fadeIn(1000);
												    a_err.fadeOut(1000);
												}
							 });
  	                   
  	               }    
    });
		   
	
	
    $('#bm_add').click( function (e,b) {	  
		      var d_a = f.serializeArray();
		      var tn = d_a[0].value;
		      var tf = d_a[1].value;
		      var tb = d_a[2].value;
		      var tno = d_a[3].value;	
		      var add_del;
		      var ob_id = {};
		      ob_id.name = 'id';
		        if( mt.html() === "<b>Add data to table</b>" )
		             {  ob_id.value = ''; add_del = true; }
		        else
		             {  ob_id.value = t_sel[0]; add_del = false; } 
		      d_a.push(ob_id);
		      f.data('bootstrapValidator').validate();
		      var vl = f.data('bootstrapValidator').isValid();
		       if(vl){
				  $.ajax({
								type: "POST",
								url: "../add/",
								data: d_a,
								success: function(maxid){
															if( add_del == true )
															  {
																	var tid = parseInt(maxid); 
																	table.row.add( [ tid, tn, tf, tb, tno ] ).draw();
																	a_add.fadeIn(1000);
																	a_add.fadeOut(1000);
														       }
														     else
														       {  
														             table.row('.selected').remove().draw( false );
														             table.row.add( [ ob_id.value, tn, tf, tb, tno ] ).draw(); 
														             a_ed.fadeIn(1000);
																	 a_ed.fadeOut(1000);
															   }
															m.modal('toggle');
														    $('#dForm').data('bootstrapValidator').resetForm();
														    $('#dForm')[0].reset();  
														    bd.addClass('disabled');
												            be.addClass('disabled');
														 },
								error: function(){
															a_err.fadeIn(1000);
															a_err.fadeOut(1000);
												 }
						 });
					 }
					 
					 
     });
			
		
	   	$("#dForm").submit(function (e) {
			                e.preventDefault();
			
		         });   
		    
		   
		   
		   
//----------------------------- Manipulate modal ----------------------------//
		
     $('#bt_add').click(function(){
			            mt.html( "<b>Add data to table</b>" );      
						m.modal({show:true});
						$('#dForm').data('bootstrapValidator').resetForm();
						$('#dForm')[0].reset();
	  });
		
	  $('#bt_edit').click(function(){
			            mt.html( "<b>Edit data of table</b>" );      
						m.modal({show:true});
						var tr_id =  t_sel[0];
						v_name.val(t_sel[1]);
						v_phone.val(t_sel[2]); 
						v_date.val(t_sel[3]); 
						v_note.val(t_sel[4]);
					    $('#dForm').data('bootstrapValidator').resetForm();
	  });
		
	 $( "#datepicker" ).datepicker( { dateFormat: "yy-mm-dd" } );
	
	 
     $('#dForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            username: {
						message: 'The username is not valid',
						validators: {
							notEmpty: {
								message: 'The username is required and can\'t be empty'
							},
							stringLength: {
								min: 3,
								max: 50,
								message: 'The username must be more than 6 and less than 30 characters long'
							}

						}
					},
	       phoneNumber: {
                validators: {
							stringLength: {
								min: 6,
								max: 15,
								message: 'The phone must be more than 6 and less than 15 characters long'
							}
					
                     }
               }  

        }
    });
       

});
