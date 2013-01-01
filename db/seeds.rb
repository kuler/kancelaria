# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
            name: 'testowy',
            password: '12345',
            password_confirmation: '12345',
            firstname: 'Jan',
            lastname: 'Testowy',
            admin: true
            )
            

TaskType.create(name: 'Analiza dokumentacji', color: '#0047b3')
TaskType.create(name: 'Analiza prawna', color: '#0047b3')
TaskType.create(name: 'Dyżur u Klienta ', color: '#0047b3')
TaskType.create(name: 'Konsultacje prawne', color: '#0047b3')
TaskType.create(name: 'Konsultacje telefoniczne', color: '#0047b3')
TaskType.create(name: 'Korespondencja mailowa', color: '#0047b3')
TaskType.create(name: 'Korespondencja przychodząca', color: '#0047b3')
TaskType.create(name: 'Korespondencja wychodząca', color: '#0047b3')
TaskType.create(name: 'Oględziny', color: '#0047b3')
TaskType.create(name: 'Porada prawna', color: '#0047b3')
TaskType.create(name: 'Przygotowanie dokumentacji w sprawie', color: '#0047b3')
TaskType.create(name: 'Przygotowanie dyspozycji o opłatę w sprawie (pełnomocnictwa)', color: '#0047b3')
TaskType.create(name: 'Przygotowanie dyspozycji o opłatę w sprawie (wpis sądowy)', color: '#0047b3')
TaskType.create(name: 'Przygotowanie opinii prawnej', color: '#0047b3')
TaskType.create(name: 'Przygotowanie pełnomocnictwa', color: '#0047b3')
TaskType.create(name: 'Przygotowanie pisma w sprawie', color: '#0047b3')
TaskType.create(name: 'Przygotowanie pozwu', color: '#0047b3')
TaskType.create(name: 'Przygotowanie projektu dokumentu', color: '#0047b3')
TaskType.create(name: 'Przygotowanie sprawozdania miesięcznego', color: '#0047b3')
TaskType.create(name: 'Przygotowanie środka zaskarżenia', color: '#0047b3')
TaskType.create(name: 'Przygotowanie wniosku o interpretację', color: '#0047b3')
TaskType.create(name: 'Przygotowanie wniosku w sprawie', color: '#0047b3')
TaskType.create(name: 'Regulowanie należności, przelewy', color: '#0047b3')
TaskType.create(name: 'Rozmowa telefoniczna', color: '#0047b3')
TaskType.create(name: 'Rozprawa sądowa', color: '#0047b3')
TaskType.create(name: 'Spotkanie ', color: '#0047b3')
TaskType.create(name: 'Szkolenie', color: '#0047b3')
TaskType.create(name: 'Uzyskiwanie odpisu/wypisu dokumentu ', color: '#0047b3')