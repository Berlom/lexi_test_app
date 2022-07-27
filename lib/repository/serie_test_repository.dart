import 'dart:convert';

import 'package:http/http.dart';

import '../models/serie_model.dart';

class SerieRepository {
  Future<List<Serie>> findAll() async {
    List<Serie> series = [];
    var jsonResponse = await get(
        Uri.https("preprod.lexi.tn", "/ds_backend/public/api/v1/series"),
        headers: {
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2NTg5MjgyODEsImV4cCI6MTY2MjUyODI4MSwicm9sZXMiOlsiUk9MRV9VU0VSIl0sInVzZXJuYW1lIjoiMDFcLzk5OSIsInNjaG9vbCI6ImVjZjBkY2E5LWNiOWItMTFlYy04YzVjLWZhMTYzZWNjYTIwOSJ9.OkCRnV8lJ4DBYRXuMPQABz4Dt3N13oJnUHnUlmF7fcpV8gaDlK77PZOoL8wpcYmIQ7751p0ItbRapchbzMMyM8FiblkRZ8i4_YAa38WJ3E2ZNrg8dK9uZbC0LW9CWExmCcnx4_tW1Xcvuafi3aTLmM2kEDw2xJ6yuUG1KfChJqODCfVSuy0GHzh0GEQQMO4g5SCOXnEgtkKTCOGLxOjgwOycKXj41oV2NXcFSersAAT-Q5zDJveHGltlvGgQCg7kEFWHeVV9ZjZQ9wUzILNusofdOOoAlfdjrsqXgpi9c9-9i-tNTDgBbfs0a56yopbkIBHXuV2VBMnz3PnRviSN1zX7KD0kg9CP7VE27chJC4oBnECcBL6rjiVy1aa2w5SpUYxqZRDm_sfJXlEda_apmzUmzWlQmEbfgZk3autsOflpIP9mllg5l4oFnfDQAq0fNoXwzgXvRofRiC7G5XbZF3JjiH7SP_KwRawd9Y3iZr5QEK9VHhyxe559V6oCTxscQc48GOKEZv_NSnrWDfv8CtCsttudb6YIBi9rQUXqqpsN0DwQz5hjOqoSpD5VTZXxi1cs8JDnPxp-qykaneZutQLq2PxHG4KXKbP9uZemvZala9zLsd-SzndgMJf7TNza0hOWSQYs-dDTCxl_R538CHbYbqtqOnDcTE569NhZhTQ'
        });

    var response = jsonDecode(jsonResponse.body);
    for (var serie in response) {
      series.add(Serie.fromJson(serie));
    }
    return series;
  }
}
