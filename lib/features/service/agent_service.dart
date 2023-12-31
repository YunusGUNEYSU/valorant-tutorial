import 'dart:io';

import 'package:dio/dio.dart';
import '../models/agents/agent_model.dart';
import '../../utils/constants/service_constants.dart';
import '../../utils/enum/service_path_enum.dart';

abstract class IAgentService {
  late final Dio dio;

  Future<List<AgentModel>?> fetchAgents();
}

class AgentService extends IAgentService {
  @override
  Dio get dio => Dio(BaseOptions(
        baseUrl: ServiceConstants.baseUrl,
        queryParameters: {
          ServiceConstants.isPlayable: true,
        },
      ));
  @override
  Future<List<AgentModel>?> fetchAgents() async {
    try {
      final response = await dio.get(ServicePathEnum.agentPath.servicePath);
      final jsonBody = response.data['data'];
      if (response.statusCode == HttpStatus.ok && jsonBody is List) {
        return jsonBody.map((e) => AgentModel.fromJson(e)).toList();
      }
    } on DioException catch (e) {
      print(e.message);
    }

    return null;
  }
}
