import 'package:dio/dio.dart';
import 'package:gen_soportes/config/constant/environment.dart';
import 'package:gen_soportes/config/db/db.dart';
import 'package:gen_soportes/features/tickets/domain/datasource/tickets_datasource.dart';
import 'package:gen_soportes/features/tickets/domain/entities/dev.dart';
import 'package:gen_soportes/features/tickets/domain/entities/ticket.dart';
import 'package:gen_soportes/features/tickets/infrastructure/mappers/TicketResponseMapper.dart';
import 'package:gen_soportes/features/tickets/infrastructure/mappers/mappers.dart';

class TicketDataSourceImp extends TicketsDataSource {
  late final Dio dio;

  TicketDataSourceImp()
      : dio = Dio(
          BaseOptions(
            baseUrl: Environment.baseURL,
          ),
        );

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

  @override
  Future<Ticket> atenderTicket(int idTicket, String solucion) async {
    var response = await dio.post(
      "/api/soportes/soportes/atender",
      data: {
        "IdTicket": idTicket,
        "Solucion": solucion,
      },
    );

    var ticketAtendido = TicketMapper.jsonToEntity(response.data);

    return ticketAtendido;
  }

  @override
  Future<Ticket> cancelarTicker(int idTicket) async {
    var response = await dio.post(
      "/api/soportes/tickets/cancelar/$idTicket",
    );

    var ticketCancelado = TicketMapper.jsonToEntity(response.data);

    return ticketCancelado;
  }

  @override
  Future<List<Dev>> getDevsAll() async {
    final response = await dio.get("/api/soportes/devs/all");

    final devs = ((response.data as List<dynamic>))
        .map((json) => DevMapper.jsonToEntity(json))
        .toList();

    return devs;
  }

  @override
  Future<Ticket> reasignarTicket(int idTicket, int idDev) async {
    final response = await dio.post("/api/soportes/tickets/reasignar",
        data: {
          "idTicket": idTicket,
          "idDev": idDev,
        },
        options: Options(contentType: Headers.jsonContentType));

    final ticketReasignado = TicketMapper.jsonToEntity(response.data);

    return ticketReasignado;
  }
}
