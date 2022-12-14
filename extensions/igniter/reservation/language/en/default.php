<?php

return [
    'text_tab_general' => 'General',
    'text_component_title' => 'Componente de la Reserva',
    'text_component_desc' => 'Muestra el formulario de reserva',
    'text_tab_reservation' => 'Opciones de reserva',

    'text_heading' => 'Reservar una mesa',
    'text_success_heading' => 'Confirmación de la Reserva',
    'text_time_heading' => 'Seleccionar hora',
    'text_reservation' => 'Mi Reserva',
    'text_heading_success' => 'Reserva confirmada',
    'text_no_table' => 'No hay mesas disponibles en el restaurante.',
    'text_find_msg' => 'Por favor utilice el siguiente formulario para encontrar una mesa para reservar',
    'text_time_msg' => 'Horarios de reserva disponibles en %s para %s Personas',
    'text_no_time_slot' => '<span class="text-danger">No hay franja horaria de reserva disponible, por favor vuelve a comprobar los detalles de tu mesa.</span>',
    'text_location_closed' => 'Lo sentimos, está cerrado, vuelve durante el horario de apertura',
    'text_date_format' => '%D, %M %j, %Y',
    'text_person' => 'persona',
    'text_people' => 'personas',

    'text_subject' => 'Mesa Reservada - %s!',
    'text_greetings' => 'Gracias %s,',
    'text_success_message' => 'Tu Reserva en %s ha sido Registrada para %s en %s. <br /> Gracias por reservar con nosotros en línea!',

    'label_status' => 'Estado',
    'label_location' => 'Ubicación',
    'label_guest_num' => 'Número de Personas',
    'label_date' => 'Fecha',
    'label_time' => 'Hora',
    'label_occasion' => 'Motivo',
    'label_select' => '- por favor, selecciona -',

    'label_first_name' => 'Nombre',
    'label_last_name' => 'Apellido',
    'label_email' => 'Correo Electrónico',
    'label_confirm_email' => 'Confirmar correo eléctronico',
    'label_telephone' => 'Teléfono',
    'label_comment' => 'Peticiones especiales',

    'label_offer_reservation' => 'Oferta de reservas/¿ofrecer reservas?',
    'label_reservation_time_interval' => 'Intervalo de tiempo de la reserva',
    'label_reservation_stay_time' => 'Tiempo de estancia de la reserva',
    'label_min_reservation_advance_time' => 'Min. Tiempo de reserva anticipada',
    'label_max_reservation_advance_time' => 'Máximo. Tiempo de reserva anticipada',
    'label_reservation_include_start_time' => 'Incluir la hora de inicio en las franjas horarias de reserva',
    'label_auto_allocate_table' => 'Asignación automática de mesas',
    'label_reservation_cancellation_timeout' => 'Tiempo de cancelación de la reserva',
    'label_limit_guests' => 'Limitar el número de invitados de la reserva/Límite de reserva Recuento de invitados',
    'label_limit_guests_count' => 'Número máximo de invitados por intervalo',

    'help_reservation_include_start_time' => 'Si se desactiva, las franjas horarias de reserva comenzarán a partir de la hora de apertura programada más el tiempo de permanencia.',
    'help_reservation_time_interval' => 'Establezca el número de minutos entre cada hora de reserva',
    'help_reservation_stay_time' => 'Establezca en minutos el tiempo medio de permanencia de un comensal en una mesa',
    'help_min_reservation_advance_time' => 'Establezca el número mínimo de días necesarios para que un invitado pueda reservar una mesa.',
    'help_max_reservation_advance_time' => 'Establezca el número máximo de días que un huésped puede reservar una mesa.',
    'help_reservation_cancellation_timeout' => 'Establece cuándo un cliente ya no puede cancelar una reserva. Número de minutos antes de la hora de la reserva. Deje como 0, para desactivar la cancelación de la reserva del cliente.',
    'help_limit_guests_count' => 'Establezca el número de invitados que se pueden reservar entre cada franja horaria.',

    'button_find_table' => 'Buscar mesa',
    'button_select_time' => 'Seleccionar hora',
    'button_change' => 'Modificar mis datos',
    'button_reset' => 'Restablecer',

    'button_find_again' => 'Encontrar mesa otra vez',
    'button_reservation' => 'Completar reserva',

    'error_invalid_location' => 'La ubicación seleccionada no es válida.',
    'error_invalid_date' => 'La fecha debe ser posterior a hoy, sólo puede hacer futuras reservas!',
    'error_invalid_datetime' => 'La fecha de la reserva seleccionada no es válida',
    'error_invalid_time' => '¡La hora debe estar entre el horario de apertura del restaurante!',

    'alert_reservation_disabled' => 'Las reservas han sido desactivadas, por favor contacte con el administrador.',
    'alert_no_table_available' => 'No se encontró una Mesa para el número especificado de Personas en el lugar seleccionado.',
    'alert_fully_booked' => 'Tenemos todo reservado para la fecha y hora seleccionadas, por favor, seleccione una fecha u hora diferente.',

    'activity_reservation_created_title' => 'Nueva reserva.',
    'activity_reservation_created' => '<b>:properties.full_name</b> hizo una reserva.',

    'reservations' => [
        'component_title' => 'Componente de Reservas ',
        'component_desc' => 'Muestra y gestiona las reservas ',
        'text_heading' => 'Ultimas reservas',
        'text_my_account' => 'Mi Cuenta',
        'text_view_heading' => 'Mis reservas',
        'text_empty' => 'No hay ninguna reserva.',

        'column_id' => 'ID de la reserva',
        'column_status' => 'Estado',
        'column_location' => 'Ubicación',
        'column_date' => 'Hora - Fecha',
        'column_table' => 'Nombre de la Mesa',
        'column_guest' => 'Número de Personas',
        'column_occasion' => 'Motivo',
        'column_telephone' => 'Teléfono',
        'column_comment' => 'Comentario',

        'button_reserve' => 'Hacer Reserva',
        'button_cancel' => 'Cancelar reserva',
        'button_back' => 'Atrás',
        'btn_view' => 'Ver',

        'alert_cancel_success' => 'La reserva fué cancelada con éxito.',
        'alert_cancel_failed' => 'No se puede cancelar la reserva, por favor contáctenos.',
    ],
];
