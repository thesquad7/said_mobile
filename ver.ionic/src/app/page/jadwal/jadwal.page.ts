import { Component, OnInit } from '@angular/core';
import { format, utcToZonedTime } from 'date-fns-tz';
import { parseISO } from 'date-fns';

@Component({
  selector: 'app-jadwal',
  templateUrl: './jadwal.page.html',
  styleUrls: ['./jadwal.page.scss'],
})
export class JadwalPage implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}

// Get the time zone set on the user's device
const userTimeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;

// Create a date object from a UTC date string
const date = new Date('2014-10-25T10:46:20Z');

// Use date-fns-tz to convert from UTC to a zoned time
const zonedTime = utcToZonedTime(date, userTimeZone);

// Create a formatted string from the zoned time
format(zonedTime, 'yyyy-MM-dd HH:mm:ssXXX', { timeZone: userTimeZone });
/**
 * This is provided in the event
 * payload from the `ionChange` event.
 * 
 * The value is an ISO-8601 date string.
 */
 const dateFromIonDatetime = '2021-06-04T14:23:00-04:00';
 const formattedString = format(parseISO(dateFromIonDatetime), 'MMM d, yyyy');
 
 console.log(formattedString);