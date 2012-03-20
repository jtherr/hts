function init() {
	$(".datepicker").datepicker();
	
	$("#dialog").dialog({
		autoOpen: false,
		width: 350,
		modal: true
	});
	
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

	initActions();
	initButtons();
}

function openDialog(title) {
	$("#dialog").dialog("open");
	$("#dialog").dialog("option", "title", title);
	initButtons();
}

function closeDialog() {
	$("#dialog").dialog("close");
}

function initActions() {
	initAdd();
	initEdit();
	initDelete();
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
			var objectName = $(this).data('object-name');
			
			$.ajax({
				url: $(this).data('request-path'),
				type: 'DELETE',
				dataType: 'html',
				headers: {
				    'X-CSRF-Token': $('meta[name=csrf-token]').attr('content')
				},
				success: function(html) {
					$(update).html(html);
					displayMessage(objectName + ' Deleted');
					initActions();
				}
			});
		}
	});
}


function initButtons() {
	$('input[type=submit]').button();
	$('input[type=button]').button();	
}

function displayMessage(message) {
	$('#messageContent').html(message);
	$('#message').show();
}
