import 'package:flutter/material.dart';
import 'package:trabalho_mobile/entities/event_entity.dart';
import 'package:trabalho_mobile/http/event_http.dart';

class EventProvider extends ChangeNotifier {
  List<Event> _events = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Event> get events => _events;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final EventHttp eventHttp = EventHttp();

  Future<void> getEvents() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _events = await eventHttp.getEvents();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createEvent(Event event) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      Event createdEvent = await eventHttp.createEvent(event);
      _events.add(createdEvent);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
