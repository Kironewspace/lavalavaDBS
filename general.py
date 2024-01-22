import pyodbc

    # Conecta a la base de datos
connection = pyodbc.connect(
       "DRIVER={SQL Server};SERVER=DESKTOP-5488JNB\MIGUEL;DATABASE=lavalava;Trusted_Connection=yes;"    )



def desconectar_base_datos(connection):
    """Desconecta de la base de datos Lava-Lava."""

    # Cierra la conexión
    connection.close()

def actualizar_fecha_registro_usuarios(connection):
    """Actualiza la fecha de registro de los usuarios."""

    # Consulta para actualizar la fecha de registro
    query = """
        UPDATE Usuarios
        SET fecha_registro = GETDATE()
    """

    # Ejecuta la consulta
    connection.execute(query)

def actualizar_fecha_contratacion_empleados(connection):
    """Actualiza la fecha de contratación de los empleados."""

    # Consulta para actualizar la fecha de contratación
    query = """
        UPDATE Empleados
        SET fecha_contratacion = GETDATE()
    """

    # Ejecuta la consulta
    connection.execute(query)

def actualizar_fecha_pago_nominas(connection):
    """Actualiza la fecha de pago de las nóminas."""

    # Consulta para actualizar la fecha de pago
    query = """
        UPDATE Nominas
        SET fecha_pago = GETDATE()
    """

    # Ejecuta la consulta
    connection.execute(query)

def actualizar_impuesto_servicios(connection):
    """Actualiza el impuesto de los servicios."""

    # Consulta para actualizar el impuesto
    query = """
        UPDATE Servicios
        SET impuesto = 18
    """

    # Ejecuta la consulta
    connection.execute(query)

def actualizar_total_servicios(connection):
    """Actualiza el total de los servicios."""

    # Consulta para actualizar el total
    query = """
        UPDATE Servicios
        SET total = precio_lavado + precio_planchado + precio_domicilio + impuesto
    """

    # Ejecuta la consulta
    connection.execute(query)
