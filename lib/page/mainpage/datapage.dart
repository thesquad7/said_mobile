import 'package:flutter/material.dart';
import 'package:said/config/calutils.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../config/dummyAPI.dart';


class page2 extends StatefulWidget {
  @override
  _page_2 createState() => _page_2();
}
class page_1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
            children: rule().data.map((data) {
              List hobby = data["penambah"];
              return InkWell(
                onTap: () {
                    print("tapped");
                  },
                child: Card(
                  margin: EdgeInsets.all(20),
                  color: Colors.indigo.withOpacity(0.1),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment:  MainAxisAlignment.start,
                      children:[
                        SizedBox(
                          height: 150,
                          width: 400,
                          child: Row(
                            mainAxisAlignment:  MainAxisAlignment.start,
                            children: [
                              SizedBox(width:10),
                              Container(
                                height: 150,
                                width: 100,
                                color: Colors.blueAccent,
                                child: Text("Foto",textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,),
                              ),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment : CrossAxisAlignment.start,
                                mainAxisAlignment:MainAxisAlignment.start,
                                children:  [
                                  Container(
                                    width: 185,
                                    child:
                                    Expanded(child: 
                                    FittedBox(child: Text("Tipe: ${data['Tipe']}", style: const TextStyle(fontWeight: FontWeight.bold),softWrap: false,maxLines: 1,overflow: TextOverflow.ellipsis,))),
                                  ),
                                  SizedBox(
                                    height: 5
                                  ),
                                  Container(
                                    height: 110,
                                    width: 185,
                                    child:
                                    // ignore: deprecated_member_use
                                    Flexible(child: Text("Biaya: USD. ${data['Biaya']}", style: TextStyle(fontSize: 12),softWrap: false,maxLines: 5,overflow: TextOverflow.fade,)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: hobby.map((color){
                                  return Container(
                                    color: Colors.grey,
                                    margin: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 8,
                                    ),
                                    padding: EdgeInsets.all(10), 
                                    child: Text(color),
                                  );
                                }).toList(),
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
        ),
    );
  }
}
class _page_2 extends State<page2>{
  set penambah(Map<String, dynamic> penambah) {}
 late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }      
}
class page_3 extends StatelessWidget{
  bool showPassword = false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Row(
                children: [
                  Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                  ))),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 90,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Colors.blue.shade600,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(
                      width:20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                          Text('User X', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          Text('Masyarakat'),
                      ],
                    )
                ],
              ),
              SizedBox(height :20),
              InkWell(
                onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Tap'),));
              },
              child: Card(child:ListTile(title: Text("Pencatatan Kependudukan"),trailing: Icon(Icons.arrow_forward))),
              ),
              InkWell(
                onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Tap'),));
              },
              child: Card(child:ListTile( title: Text("Administrasi Properti"),trailing: Icon(Icons.arrow_forward))),
              ),
              InkWell(
                onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Tap'),));
              },
              child: Card(child:ListTile( title: Text("Pelaporan Tamu"), trailing: Icon(Icons.arrow_forward))),
              ),
              InkWell(
                onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Tap'),));
              },
              child: Card(child:ListTile( title: Text("Pendaftaran Event Desa"), trailing: Icon(Icons.arrow_forward))),
              ),
              InkWell(
                onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Tap'),));
              },
              child: Card(child:ListTile( title: Text("Pendataan Token Rapat"), trailing: Icon(Icons.arrow_forward))),
              ),
              InkWell(
                onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Tap'),));
              },
              child: Card(child:ListTile( title: Text("Adminstrasi Keluarga"), trailing: Icon(Icons.arrow_forward)))
              ),
          ],
        ),
      ),
      ),
    );
  }
}