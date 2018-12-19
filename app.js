function deleteItem() {
  var taskid = $(this).parent().find('.task_id').val();
  $.post('deletetask.php', { taskid: taskid }).done(function (data) {
    console.log(data);
  });

  $(this).parent().remove();
}

function itemdone() {
  $(this).parent().toggleClass('done');
}

$(document).ready(function () {
  console.log('loaded');

  // Show Model for the New Group window //

  $('.show-newgroup-modal').click(function (event) {
    event.preventDefault();
    console.log('modal 1');

    $('#newgroup-modal').modal('show').find('input[type=text], textarea').val('');

  });

  // Show Model for the task button //

  $('.show-task-modal').click(function (event) {
    event.preventDefault();

    $('#task-modal').modal('show');
    $('#task-modal').find('.group_id').val($(this).parent().parent().find('.group-hidden').val());
    var groupid = $('#task-modal').find('.group_id').val();

    console.log('modal 2 : ' + groupid);
    $.post('tasktogroup.php',
    { groupid: groupid }).done
    (function (data) {
      //console.log(data);
      $('#task-modal').find('.modal-footer').html(data);
      $('#tasklist').on('change', '.itemdone', itemdone);
      $('#tasklist').on('click', '.deleteItem', deleteItem);
    });
  });

  // Create! button to create new groups in dashboard //

  $('#modal-save').click(function (event) {
    console.log('btn');
    console.log($('.form-control-input-lg').val());

    event.preventDefault();

    groupitem = $('#template').clone(true);
    groupitem.id = 'group_' + $('.list-group-item').length;
    groupitem.find('.list-group-item-heading').html($('.form-control-input-lg').val());
    groupitem.find('.list-group-item-text').html($('.form-control').val());
    $('#newgroup-modal').modal('hide');
    $('.list-group').append(groupitem);

    groupitem.show();

    groupnamevalue = $('.form-control-input-lg').val();
    groupdescvalue = $('.form-control').val();
    $.post('insert_groups.php',
    { groupname: groupnamevalue, groupdescription: groupdescvalue }).done
    (function (data) { groupitem.find('.group-hidden').val(data);
    });

  });

  // Delete Groups with X button //
  $('.xbutton').click(function (event) {
    console.log('x button');

    event.preventDefault();
    groupid = $(this).parent().parent().find('.group-hidden').val();
    $(this).parent().parent('.list-group-item').remove();
    $.post('deletegroup.php', { groupid: groupid }).done(function (data) {
      console.log(data);
    });
  });

  // Add tasks to list in task modal //

  $('#add').click(function (event) {
    console.log('add');
    event.preventDefault();

    $('#addtolist').on('keypress', function (event) {
      if (event.which === 13) {
        addItem();
        event.preventDefault();
      }
    });

    var groupid = $(this).parent().parent().find('.group_id').val();
    var taskitem = $('#addtolist').val();
    if (taskitem.length > 0) {
      $.post('insert_tasks.php',
      { groupid: groupid, taskname: taskitem }).done
      (function (data) {
        $('#tasklist').append('<li><input class = "itemdone" type="checkbox">' + taskitem +
        '<input type="hidden" class="task_id" value="' + data + '"/>' +
        '<span class="glyphicon glyphicon-trash deleteItem"></span></li>');
        $('#addtolist').val('');

        $('#tasklist').on('change', '.itemdone', itemdone);
        $('#tasklist').on('click', '.deleteItem', deleteItem);
      });

    }

  });
});
