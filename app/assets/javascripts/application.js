// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function init() {
	$(".datepicker").datepicker();
	
	$("#dialog").dialog({
		autoOpen: false,
		width: 350,
		modal: true
	});
	
	initButtons();
	
	var sortableHelper = function(e, ui) {
    	ui.children().each(function() {
    	    $(this).width($(this).width());
    	});
    	return ui;
	};
	
	$(".sortable").sortable({ 
		handle: '.handle',
		items: 'tr.sort-item',
		helper: sortableHelper,
		update: function(event, ui) {
			$.get($(this).data('request-path'), $('form.sortableForm').serialize());
		}
	});
	
	$(document).ajaxStop(function() {
		initButtons();
	})

	
	
	initAdd();
	initEdit();
	initDelete();	
}

function openDialog(title) {
	$("#dialog").dialog("open");
	$("#dialog").dialog("option", "title", title);
}

function closeDialog() {
	$("#dialog").dialog("close");
}

function initAdd() {
	$('.add').click(function() {
		var title = 'Add ' + $(this).data('object-name');
		
		$.get($(this).data('request-path'), function(html) {
			$('#dialogContent').html(html);
			openDialog(title);
		}, 'html');
	});
}

function initEdit() {
	$('.edit').click(function() {
		var title = 'Edit ' + $(this).data('object-name');
		
		$.get($(this).data('request-path'), function(html) {
			$('#dialogContent').html(html);
			openDialog(title);
		}, 'html');
	});
}

function initDelete() {
	$('.delete').click(function() {
		if (confirm('Are you sure?')) {
			var update = '#' + $(this).data('update');
			
			$.ajax({
				url: $(this).data('request-path'),
				type: 'DELETE',
				dataType: 'html',
				headers: {
				    'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
				},
				success: function(html) {
					$(update).html(html);
				}
			});
		}
	});
}


function initButtons() {
	$('input[type=submit]').button();
	$('input[type=button]').button();	
}
