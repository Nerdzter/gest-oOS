import 'package:flutter/material.dart';

import '../modules/os/pages/os_list_page.dart' as os_list;
import '../modules/os/pages/os_detail_page.dart' as os_detail;
import '../modules/clientes/pages/clientes_page.dart' as clientes;
import '../modules/estoque/pages/estoque_page.dart' as estoque;
import '../modules/usuarios/pages/usuarios_page.dart' as usuarios;
import '../modules/auth/pages/login_page.dart' as auth;
import '../modules/dashboard/pages/dashboard_page.dart' as dashboard;

class AppRoutes {
  static const login = '/';
  static const dashboardRoute = '/dashboard';
  static const osList = '/os-list';
  static const osDetail = '/os-detail';
  static const clientesRoute = '/clientes';
  static const estoqueRoute = '/estoque';
  static const usuariosRoute = '/usuarios';

  static Map<String, WidgetBuilder> get routes => {
        login: (_) => auth.LoginPage(),
        dashboardRoute: (_) => dashboard.DashboardPage(),
        osList: (_) => os_list.OSListPage(),
        osDetail: (_) => os_detail.OSDetailPage(),
        clientesRoute: (_) => clientes.ClientesPage(),
        estoqueRoute: (_) => estoque.EstoquePage(),
        usuariosRoute: (_) => usuarios.UsuariosPage(),
      };
}
