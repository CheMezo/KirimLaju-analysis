create database kirimlaju_logistik;
use kirimlaju_logistik;

alter table customers
modify column registration_date date;

alter table shipments
modify column pickup_date date;

alter table shipments
modify column estimated_delivery date;

select shipment_id, actual_delivery
from shipments
where actual_delivery = '';

set sql_safe_updates = 0;
update shipments
set actual_delivery = null
where actual_delivery = '';

alter table shipments
modify column actual_delivery date;

set SQL_SAFE_UPDATES = 0;
update customers
set phone = replace(phone, '-', '');

select * from shipments;

select shipment_id, actual_delivery
from shipments
where actual_delivery IS NULL;

set SQL_SAFE_UPDATES = 0;
alter table status_history
modify column update_timestamp datetime;