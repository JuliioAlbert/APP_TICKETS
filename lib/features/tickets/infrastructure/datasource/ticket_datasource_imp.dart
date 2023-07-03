import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gen_soportes/config/constant/environment.dart';
import 'package:gen_soportes/features/tickets/domain/datasource/tickets_datasource.dart';
import 'package:gen_soportes/features/tickets/domain/entities/ticket.dart';
import 'package:gen_soportes/features/tickets/infrastructure/mappers/TicketResponseMapper.dart';

class TicketDataSourceImp extends TicketsDataSource {
  late final Dio dio;

  TicketDataSourceImp()
      : dio = Dio(
          BaseOptions(
            baseUrl: Environment.baseURL,
          ),
        );

  @override
  Future<Ticket> atenderTicket(Ticket ticket) {
    // TODO: implement atenderTicket
    throw UnimplementedError();
  }

  @override
  Future<Ticket> cancelarTicker(Ticket ticket) {
    // TODO: implement cancelarTicker
    throw UnimplementedError();
  }

  @override
  Future<List<Ticket>> getTicketByUsuario(int idUsuario) async {
    var response = await dio.post("/api/soportes/tickets/filter", data: {
      "Usuario": {"IdUsuario": idUsuario}
    });

    var tickets = ((response.data) as List<dynamic>)
        .map((json) => TicketMapper.jsonToEntity(json))
        .toList();

    return tickets;
  }
}
