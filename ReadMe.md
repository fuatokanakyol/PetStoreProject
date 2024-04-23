# Pet Store API Test Projesi
### Bu proje, Pet Store uygulamasının API'sini test etmek için Karate ve Cucumber kullanır. Proje, petlerin ve kullanıcıların eklenmesi, güncellenmesi, silinmesi ve sorgulanması gibi temel işlevleri test etmek için senaryolar içerir.

## Gereksinimler
### Java 8 veya daha üstü
### Maven

## Kurulum
### Projenin kök dizininde, terminal veya komut istemcisini açın.
#### Aşağıdaki komutu çalıştırarak bağımlılıkları yükleyin:
mvn clean install

## Nasıl Çalıştırılır
### Test senaryolarını çalıştırmak için aşağıdaki komutu kullanın:

#### mvn test 
### ConduitTest sınıfı altındaki tüm senaryolar için 
#### mvn test -Dtest=ConduitTest

### SAdece debug taglı testler için 
#### mvn test -Dtest=PetStoreTest#testDebug

### Spesifik bir feature satırını çalıştrımak için 
#### mvn test -Dkarate.options="classpath:petStoreApp/feature/HomePage.feature:7"
### Feature altındaki testleri alıştırmak için
#### mvn test -Dtest=PetStoreTest#testAll
## Senaryolar
#### Proje, petler ve kullanıcılar üzerinde yapılan işlemleri test etmek için aşağıdaki senaryoları içerir:

### Pet İşlemleri
#### =>Yeni bir pet eklemek
#### =>Eklenen peti kontrol etmek
#### =>Pet ismini güncellemek ve doğrulamak
#### =>Bir peti bulmak ve kontrol etmek
#### =>Bir peti silmek ve kontrol etmek
### Kullanıcı İşlemleri
#### =>Yeni bir kullanıcı eklemek
#### =>Eklenen kullanıcıyı kontrol etmek
#### =>Kullanıcı girişi yapmak ve doğrulamak
#### =>Kullanıcı bilgilerini güncellemek ve doğrulamak
#### =>Kullanıcıyı çıkış yapmaya zorlamak ve kontrol etmek

## Her senaryo, Karate ve Cucumber kullanarak yazılmıştır ve proje içinde ilgili dosyalarda bulunabilir.