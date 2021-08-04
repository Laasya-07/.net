FROM  mcr.microsoft.com/dotnet/core/sdk:2.2
COPY src/HotelReservationSystem  HotelReservationSystem/
COPY /src/HotelReservationSystemTypes HotelReservationSystemTypes/
WORKDIR /HotelReservationSystem
RUN dotnet restore "HotelReservationSystem.csproj" \
    && dotnet build "HotelReservationSystem.csproj" -c Release -o /app \
    && dotnet publish "HotelReservationSystem.csproj" -c Release -o /app
EXPOSE 80
WORKDIR /app
ENTRYPOINT ["dotnet", "HotelReservationSystem.dll"]
